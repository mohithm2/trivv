using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Trivago.Models;

namespace Trivago.Controllers
{
    [Authorize]
    public class Hotel_BookingController : Controller
    {
        private TrivagoDatabase db = new TrivagoDatabase();

        // GET: Hotel_Booking
        public ActionResult Index()
        {
            var hotel_Booking = db.Hotel_Booking.Include(h => h.Customer).Include(h => h.Hotel);
            return View(hotel_Booking.ToList());
        }

        // GET: Hotel_Booking/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hotel_Booking hotel_Booking = db.Hotel_Booking.Find(id);
            if (hotel_Booking == null)
            {
                return HttpNotFound();
            }
            return View(hotel_Booking);
        }

        // GET: Hotel_Booking/Create
        public ActionResult Create()
        {
            ViewBag.CUSTOMERID = new SelectList(db.Customers, "CUSTOMERID", "NAME");
            ViewBag.HOTELID = new SelectList(db.Hotels, "HOTELID", "NAME");
            return View();
        }

        // POST: Hotel_Booking/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "HOTELID,CUSTOMERID,CHECK_IN,CHECK_OUT")] Hotel_Booking hotel_Booking)
        {
            if (ModelState.IsValid)
            {
                db.Hotel_Booking.Add(hotel_Booking);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CUSTOMERID = new SelectList(db.Customers, "CUSTOMERID", "NAME", hotel_Booking.CUSTOMERID);
            ViewBag.HOTELID = new SelectList(db.Hotels, "HOTELID", "NAME", hotel_Booking.HOTELID);
            return View(hotel_Booking);
        }

        // GET: Hotel_Booking/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hotel_Booking hotel_Booking = db.Hotel_Booking.Find(id);
            if (hotel_Booking == null)
            {
                return HttpNotFound();
            }
            ViewBag.CUSTOMERID = new SelectList(db.Customers, "CUSTOMERID", "NAME", hotel_Booking.CUSTOMERID);
            ViewBag.HOTELID = new SelectList(db.Hotels, "HOTELID", "NAME", hotel_Booking.HOTELID);
            return View(hotel_Booking);
        }

        // POST: Hotel_Booking/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "HOTELID,CUSTOMERID,CHECK_IN,CHECK_OUT")] Hotel_Booking hotel_Booking)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hotel_Booking).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CUSTOMERID = new SelectList(db.Customers, "CUSTOMERID", "NAME", hotel_Booking.CUSTOMERID);
            ViewBag.HOTELID = new SelectList(db.Hotels, "HOTELID", "NAME", hotel_Booking.HOTELID);
            return View(hotel_Booking);
        }

        // GET: Hotel_Booking/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hotel_Booking hotel_Booking = db.Hotel_Booking.Find(id);
            if (hotel_Booking == null)
            {
                return HttpNotFound();
            }
            return View(hotel_Booking);
        }

        // POST: Hotel_Booking/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Hotel_Booking hotel_Booking = db.Hotel_Booking.Find(id);
            db.Hotel_Booking.Remove(hotel_Booking);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
