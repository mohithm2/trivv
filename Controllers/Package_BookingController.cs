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
    public class Package_BookingController : Controller
    {
        private TrivagoDatabase db = new TrivagoDatabase();

        // GET: Package_Booking
        public ActionResult Index()
        {
            var package_Booking = db.Package_Booking.Include(p => p.Customer).Include(p => p.Package);
            return View(package_Booking.ToList());
        }

        // GET: Package_Booking/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Package_Booking package_Booking = db.Package_Booking.Find(id);
            if (package_Booking == null)
            {
                return HttpNotFound();
            }
            return View(package_Booking);
        }

        // GET: Package_Booking/Create
        public ActionResult Create()
        {
            ViewBag.CUSTOMERID = new SelectList(db.Customers, "CUSTOMERID", "NAME");
            ViewBag.PACKAGEID = new SelectList(db.Packages, "PACKAGEID", "PRICE");
            return View();
        }

        // POST: Package_Booking/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PACKAGEID,CUSTOMERID,BOOKING_DATE")] Package_Booking package_Booking)
        {
            if (ModelState.IsValid)
            {
                db.Package_Booking.Add(package_Booking);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CUSTOMERID = new SelectList(db.Customers, "CUSTOMERID", "NAME", package_Booking.CUSTOMERID);
            ViewBag.PACKAGEID = new SelectList(db.Packages, "PACKAGEID", "PRICE", package_Booking.PACKAGEID);
            return View(package_Booking);
        }

        // GET: Package_Booking/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Package_Booking package_Booking = db.Package_Booking.Find(id);
            if (package_Booking == null)
            {
                return HttpNotFound();
            }
            ViewBag.CUSTOMERID = new SelectList(db.Customers, "CUSTOMERID", "NAME", package_Booking.CUSTOMERID);
            ViewBag.PACKAGEID = new SelectList(db.Packages, "PACKAGEID", "PRICE", package_Booking.PACKAGEID);
            return View(package_Booking);
        }

        // POST: Package_Booking/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PACKAGEID,CUSTOMERID,BOOKING_DATE")] Package_Booking package_Booking)
        {
            if (ModelState.IsValid)
            {
                db.Entry(package_Booking).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CUSTOMERID = new SelectList(db.Customers, "CUSTOMERID", "NAME", package_Booking.CUSTOMERID);
            ViewBag.PACKAGEID = new SelectList(db.Packages, "PACKAGEID", "PRICE", package_Booking.PACKAGEID);
            return View(package_Booking);
        }

        // GET: Package_Booking/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Package_Booking package_Booking = db.Package_Booking.Find(id);
            if (package_Booking == null)
            {
                return HttpNotFound();
            }
            return View(package_Booking);
        }

        // POST: Package_Booking/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Package_Booking package_Booking = db.Package_Booking.Find(id);
            db.Package_Booking.Remove(package_Booking);
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
