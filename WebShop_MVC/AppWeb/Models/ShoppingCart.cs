using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppWeb.ShopWS;

namespace AppWeb.Models
{
    public partial class ShoppingCart
    {
        List<Cart> dbCart = new List<Cart>();
        string ShoppingCartId { get; set; }
        public const string CartSessionKey = "CartId";

        public static ShoppingCart GetCart(HttpContextBase context)
        {
            var cart = new ShoppingCart();
            cart.ShoppingCartId = cart.GetCartId(context);
            return cart;
        }
        // Helper method to simplify shopping cart calls
        public static ShoppingCart GetCart(Controller controller)
        {
            return GetCart(controller.HttpContext);
        }
        public void AddToCart(TProducto product)
        {
            var cartItem = dbCart.Where(x => x.CodProducto == product.CodProducto).Select(x => x).SingleOrDefault();
            if (cartItem == null)
            {
                cartItem = new Cart
                {
                    CodProducto = product.CodProducto,
                    CartId = ShoppingCartId,
                    Cantidad = 1
                };
                dbCart.Add(cartItem);
            }
            else
            {
                cartItem.Cantidad++;
            }
        }
        public int RemoveFromCart(int id)
        {
            var cartItem = dbCart.Where(x => x.CodProducto == id).Select(x => x).SingleOrDefault();
            int itemCount = 0;
            if (cartItem != null)
            {
                if (cartItem.Cantidad > 1)
                {
                    cartItem.Cantidad--;
                    itemCount = cartItem.Cantidad;
                }
                else
                {
                    dbCart.Remove(cartItem);
                }
            }
            return itemCount;
        }
        public void EmptyCart()
        {
            var cartItems = dbCart.Where(x => x.CartId == ShoppingCartId).Select(x => x).ToList();
            foreach (var cartItem in cartItems)
            {
                dbCart.Remove(cartItem);
            }
        }
        public List<Cart> GetCartItems()
        {
            return dbCart.Where(x => x.CartId == ShoppingCartId).Select(x => x).ToList();
        }
        public int GetCount()
        {
            int? count = (from cartItems in dbCart
                          where cartItems.CartId == ShoppingCartId
                          select (int?)cartItems.Cantidad).Sum();
            return count ?? 0;
        }
        public decimal GetTotal()
        {
            decimal? total = (from cartItems in dbCart
                              where cartItems.CartId == ShoppingCartId
                              select (int?)cartItems.Cantidad *
                              cartItems.CodProducto).Sum();

            return total ?? decimal.Zero;
        }
        public string GetCartId(HttpContextBase context)
        {
            if (context.Session[CartSessionKey] == null)
            {
                if (!string.IsNullOrWhiteSpace(context.User.Identity.Name))
                {
                    context.Session[CartSessionKey] =
                        context.User.Identity.Name;
                }
                else
                {
                    Guid tempCartId = Guid.NewGuid();
                    context.Session[CartSessionKey] = tempCartId.ToString();
                }
            }
            return context.Session[CartSessionKey].ToString();
        }

        public void MigrateCart(string userName)
        {
            var shoppingCart = dbCart.Where(
                c => c.CartId == ShoppingCartId);

            foreach (Cart item in shoppingCart)
            {
                item.CartId = userName;
            }
        }
    }
}