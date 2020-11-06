using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreFront.Models;

namespace StoreFront.Controllers
{
    public class ShoppingCartController : Controller
    {
        // GET: ShoppingCart
        public ActionResult Index()
        {
            // pull in session based cart into a local variable that we can pass to the view
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            if (shoppingCart == null || shoppingCart.Count == 0)
            {
                // the user either hasn't put anything in the cart or removed all the items, or the session has expired
                // set cart to an empty object (can still send that to the view, unlike NULL)
                shoppingCart = new Dictionary<int, CartItemViewModel>();

                // create a message about the empty shopping cart
                ViewBag.Message = "There are no items in your cart";
            }
            else
            {
                ViewBag.Message = null; // explicityly clearing out the value in Message
            }

            return View(shoppingCart);
        }

        public ActionResult RemoveFromCart(int id)
        {
            // get the cart out of session and into a local variable 
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            // remove the item from the local shoppingCart
            shoppingCart.Remove(id);

            //// set up a ViewBag message if no items are in the cart
            //if (shoppingCart.Count == 0)
            //{
            //    ViewBag.Message = "You've removed all items from your cart";
            //}
            // The code above will not yield a message on the view. The Index ActionResult overwrites the ViewBag.Message. If you wanted to pass
            // a message about removing all itmes then you would need to make a different ViewBag variable.

            // return the local shopping cart to the session and send the user back to the Shopping Cart Index
            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }

        public ActionResult UpdateCart(int bookID, int qty)
        {
            // get the cart out of session and into a local variable 
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            // target the correct cart item using the BookID key then change the qty property using
            // the qty parameter
            shoppingCart[bookID].Qty = qty;

            // return the local shopping cart to the session and send the user back to the Shopping Cart Index
            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }

    }
}