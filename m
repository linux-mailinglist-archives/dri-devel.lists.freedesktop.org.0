Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDB0116A35
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B24088E45;
	Mon,  9 Dec 2019 09:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C0988E45
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 09:53:31 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19510028-1500050 for multiple; Mon, 09 Dec 2019 09:53:26 +0000
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: "info@dantalion.nl" <info@dantalion.nl>, dri-devel@lists.freedesktop.org
References: <e38fc8f1-9476-afd1-64b9-7d7387e1ccfe@dantalion.nl>
In-Reply-To: <e38fc8f1-9476-afd1-64b9-7d7387e1ccfe@dantalion.nl>
Message-ID: <157588520564.2308.7865900106879689910@skylake-alporthouse-com>
Subject: Re: i915 GPU HANG: 9:0:0x0, hang on rcs0 but can't report bug
Date: Mon, 09 Dec 2019 09:53:25 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBpbmZvQGRhbnRhbGlvbi5ubCAoMjAxOS0xMi0wOSAwODozNDoyOCkKPiBIZWxsbyBl
dmVyeW9uZSwKPiAKPiBUaGlzIGlzIG15IGZpcnN0IG1lc3NhZ2Ugb24gdGhpcyBtYWlsaW5nIGxp
c3Qgc28gYmVhciB3aXRoIG1lLiBJIGFtCj4gcnVubmluZyBhbiBBcmNoIGJhc2VkIHN5c3RlbSB3
aXRoIGtlcm5lbCA1LjMueCwgeG9yZy1zZXJ2ZXIgMS4yMC41IGFuZAo+IHhmODYtdmlkZW8taW50
ZWwgMToyLjk5LjkxNy4KPiAKPiBSZWNlbnRseSBJIGhhdmUgYmVlbiByZWNlaXZpbmcgR1BVIEhB
TkdTIHdlcmUgbXkgc2NyZWVuIGFuZCBtb3VzZSBmcmVlemUKPiBmb3Igc2V2ZXJhbCBzZWNvbmRz
IGF0IGEgdGltZS4gbG9va2luZyBpbiBkbWVzZyBJIGdldCB0aGUgZm9sbG93aW5nOgo+IAo+IGk5
MTUgMDAwMDowMDowMi4wOiBHUFUgSEFORzogZWNvZGUgOTowOjB4MDAwMDAwMDAsIGhhbmcgb24g
cmNzMAo+IFtkcm1dIEdQVSBoYW5ncyBjYW4gaW5kaWNhdGUgYSBidWcgYW55d2hlcmUgaW4gdGhl
IGVudGlyZSBnZnggc3RhY2ssCj4gaW5jbHVkaW5nIHVzZXJzcGFjZS4KPiBbZHJtXSBQbGVhc2Ug
ZmlsZSBhIF9uZXdfIGJ1ZyByZXBvcnQgb24gYnVncy5mcmVlZGVza3RvcC5vcmcgYWdhaW5zdCBE
UkkKPiAtPiBEUk0vSW50ZWwKPiBbZHJtXSBkcm0vaTkxNSBkZXZlbG9wZXJzIGNhbiB0aGVuIHJl
YXNzaWduIHRvIHRoZSByaWdodCBjb21wb25lbnQgaWYKPiBpdCdzIG5vdCBhIGtlcm5lbCBpc3N1
ZS4KPiBbZHJtXSBUaGUgZ3B1IGNyYXNoIGR1bXAgaXMgcmVxdWlyZWQgdG8gYW5hbHl6ZSBncHUg
aGFuZ3MsIHNvIHBsZWFzZQo+IGFsd2F5cyBhdHRhY2ggaXQuCj4gW2RybV0gR1BVIGNyYXNoIGR1
bXAgc2F2ZWQgdG8gL3N5cy9jbGFzcy9kcm0vY2FyZDEvZXJyb3IKCldlJ3JlIGluIHRoZSBtaWRk
bGUgb2YgbWlncmF0aW5nIHRvIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaW50
ZWwvaXNzdWVzL25ldwphbmQgaGF2ZW4ndCB1cGRhdGVkIGFsbCB0aGUgbGlua3MgaW4gZWFybGll
ciBrZXJuZWxzIHlldC4KCj4gSSBzYXZlZCB0aGUgb3V0cHV0IHRvIGEgZmlsZSBhbmQgcHJvY2Vl
ZGVkIHRvIG1ha2UgYW4gYWNjb3VudCBvbiB0aGUKPiB3ZWJzaXRlIG1lbnRpb25lZC4gQnV0IG5v
dyBJIGFtIHVuYWJsZSB0byBjcmVhdGUgYSBidWcgcmVwb3J0IGJlaW5nCj4gZ3JlZXRlZCBieSBh
IG1lc3NhZ2UgIkVpdGhlciBubyBwcm9kdWN0cyBoYXZlIGJlZW4gZGVmaW5lZCB0byBlbnRlciBi
dWdzCj4gYWdhaW5zdCBvciB5b3UgaGF2ZSBub3QgYmVlbiBnaXZlbiBhY2Nlc3MgdG8gYW55LiIK
PiAKPiBIb3cgZG8gSSBwcm9jZWVkIGFsdGVybmF0aXZlbHkgSSBjYW4gZW1haWwgdGhlIGR1bXAg
ZmlsZSBhbmQgc29tZW9uZQo+IHdpdGggdGhlIGFwcHJvcHJpYXRlIHBlcm1pc3Npb25zIGNhbiBy
ZXBvcnQgaXQgZm9yIG1lLgoKU2VlCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9w
YXRjaC8zNDQxMDUvP3Nlcmllcz03MDYwNSZyZXY9MgotQ2hyaXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
