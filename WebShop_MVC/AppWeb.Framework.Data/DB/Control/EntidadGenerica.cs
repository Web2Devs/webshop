using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppWeb.Framework.Data.DB.Model;

namespace AppWeb.Framework.Data.DB.Control
{
    public class EntidadGenerica<TEntity> where TEntity : class
    {
        private readonly BDWebShopSQL context;
        private readonly DbSet<TEntity> dbSet;

        public EntidadGenerica(BDWebShopSQL _context)
        {
            context = _context;
            dbSet = _context.Set<TEntity>();
        }
        public TEntity Create(TEntity entity)
        {
            return dbSet.Add(entity);
        }
        public void CreateRange(IEnumerable<TEntity> entities)
        {
            foreach (var entity in entities)
            {
                Create(entity);
            }
        }
        public async Task<TEntity> FindAsync(params object[] keyValues)
        {
            return await dbSet.FindAsync(keyValues);
        }
        public TEntity Find(params object[] keyValues)
        {
            return dbSet.Find(keyValues);
        }
        public virtual IQueryable<TEntity> SelectQuery(string query, params object[] parameters)
        {
            return dbSet.SqlQuery(query, parameters).AsQueryable();
        }
        public void Update(TEntity entity)
        {
            dbSet.Attach(entity);
            context.Entry(entity).State = EntityState.Modified;
        }
        public void Delete(TEntity entity)
        {
            if (context.Entry(entity).State == EntityState.Detached)
            {
                dbSet.Attach(entity);
            }
            dbSet.Remove(entity);
        }
        public async Task Delete(params object[] id)
        {
            TEntity entity = await this.FindAsync(id);
            if (entity != null)
            {
                this.Delete(entity);
            }
        }
        public IEnumerable<TEntity> GetAll()
        {
            return dbSet.ToList();
        }
        public IQueryable<TEntity> Queryable()
        {
            return dbSet;
        }
    }
}
