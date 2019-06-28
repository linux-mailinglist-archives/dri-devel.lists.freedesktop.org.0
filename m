Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEF55B121
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A6589CC4;
	Sun, 30 Jun 2019 18:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9405F6E8E5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 11:34:19 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jun 2019 04:34:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; d="scan'208";a="183670461"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 28 Jun 2019 04:34:16 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 28 Jun 2019 14:34:16 +0300
Date: Fri, 28 Jun 2019 14:34:15 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
Message-ID: <20190628113415.GL2640@lahna.fi.intel.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDE6MDg6MDdQTSArMDIwMCwgVGltdXIgS3Jpc3TDs2Yg
d3JvdGU6Cj4gSGkgTWlrYSwKPiAKPiBUaGFua3MgZm9yIHlvdXIgcXVpY2sgcmVwbHkuCj4gCj4g
PiA+IDEuIFdoeSBhcmUgdGhlcmUgZm91ciBicmlkZ2UgZGV2aWNlcz8gMDQ6MDAuMCwgMDQ6MDEu
MCBhbmQgMDQ6MDIuMAo+ID4gPiBsb29rCj4gPiA+IHN1cGVyZmx1b3VzIHRvIG1lIGFuZCBub3Ro
aW5nIGlzIGNvbm5lY3RlZCB0byB0aGVtLiBJdCBhY3R1YWxseQo+ID4gPiBnaXZlcwo+ID4gPiBt
ZSB0aGUgZmVlbGluZyB0aGF0IHRoZSBUQjMgZHJpdmVyIGNyZWF0ZXMgNCBkZXZpY2VzIHdpdGgg
Mi41IEdUL3MKPiA+ID4gZWFjaCwgaW5zdGVhZCBvZiBvbmUgZGV2aWNlIHRoYXQgY2FuIGRvIHRo
ZSBmdWxsIDggR1Qvcy4KPiA+IAo+ID4gQmVjYXVzZSBpdCBpcyBzdGFuZGFyZCBQQ0llIHN3aXRj
aCB3aXRoIG9uZSB1cHN0cmVhbSBwb3J0IGFuZCBuCj4gPiBkb3duc3RyZWFtIHBvcnRzLgo+IAo+
IFN1cmUsIHRob3VnaCBpbiB0aGlzIGNhc2UgMyBvZiB0aG9zZSBkb3duc3RyZWFtIHBvcnRzIGFy
ZSBub3QgZXhwb3NlZAo+IGJ5IHRoZSBoYXJkd2FyZSwgc28gaXQncyBhIGJpdCBzdXJwcmlzaW5n
IHRvIHNlZSB0aGVtIHRoZXJlLgoKVGhleSBsZWFkIHRvIG90aGVyIHBlcmlwaGVyYWxzIG9uIHRo
ZSBUQlQgaG9zdCByb3V0ZXIgc3VjaCBhcyB0aGUgVEJUCmNvbnRyb2xsZXIgYW5kIHhIQ0kuIEFs
c28gdGhlcmUgYXJlIHR3byBkb3duc3RyZWFtIHBvcnRzIGZvciBleHRlbnNpb24KZnJvbSB3aGlj
aCB5b3UgZUdQVSBpcyB1c2luZyBvbmUuCgo+IFdoeSBJIGFza2VkIGFib3V0IGl0IGlzIGJlY2F1
c2UgSSBoYXZlIGEgc3VzcGljaW9uIHRoYXQgbWF5YmUgdGhlCj4gYmFuZHdpZHRoIGlzIGFsbG9j
YXRlZCBlcXVhbGx5IGJldHdlZW4gdGhlIDQgZG93bnN0cmVhbSBwb3J0cywgZXZlbgo+IHRob3Vn
aCBvbmx5IG9uZSBvZiB0aGVtIGlzIHVzZWQuCj4gCj4gPiAKPiA+ID4gMi4gV2h5IGFyZSBzb21l
IG9mIHRoZSBicmlkZ2UgZGV2aWNlcyBvbmx5IGNhcGFibGUgb2YgMi41IEdUL3MKPiA+ID4gYWNj
b3JkaW5nIHRvIGxzcGNpPwo+ID4gCj4gPiBZb3UgbmVlZCB0byB0YWxrIHRvIGxzcGNpIG1haW50
YWluZXIuCj4gCj4gU29ycnkgaWYgdGhlIHF1ZXN0aW9uIHdhcyB1bmNsZWFyLgo+IEl0J3Mgbm90
IG9ubHkgbHNwY2ksIHRoZSBrZXJuZWwgYWxzbyBwcmludHMgYSB3YXJuaW5nIGFib3V0IGl0Lgo+
IAo+IExpa2UgSSBzYWlkIHRoZSBkZXZpY2UgcmVhbGx5IGlzIGxpbWl0ZWQgdG8gMi41IEdUL3Mg
ZXZlbiB0aG91Z2ggaXQKPiBzaG91bGQgYmUgYWJsZSB0byBkbyA4IEdUL3MuCgpUaGVyZSBpcyBU
aHVuZGVyYm9sdCBsaW5rIGJldHdlZW4gdGhlIGhvc3Qgcm91dGVyICh5b3VyIGhvc3Qgc3lzdGVt
KSBhbmQKdGhlIGVHUFUgYm94LiBUaGF0IGxpbmsgaXMgbm90IGxpbWl0ZWQgdG8gMi41IEdUL3Mg
c28gZXZlbiBpZiB0aGUgc2xvdApjbGFpbXMgaXQgaXMgUENJIGdlbjEgdGhlIGFjdHVhbCBiYW5k
d2lkdGggY2FuIGJlIG11Y2ggaGlnaGVyIGJlY2F1c2Ugb2YKdGhlIHZpcnR1YWwgbGluay4KCj4g
PiA+IDMuIElzIGl0IHBvc3NpYmxlIHRvIG1hbnVhbGx5IHNldCB0aGVtIHRvIDggR1Qvcz8KPiA+
IAo+ID4gTm8gaWRlYS4KPiA+IAo+ID4gQXJlIHlvdSBhY3R1YWxseSBzZWVpbmcgc29tZSBwZXJm
b3JtYW5jZSBpc3N1ZSBiZWNhdXNlIG9mIHRoaXMgb3IgYXJlCj4gPiB5b3UganVzdCBjdXJpb3Vz
Pwo+IAo+IFllcywgSSBzZWUgYSBub3RpY2FibGUgcGVyZm9ybWFuY2UgaGl0OiBzb21lIGdhbWVz
IGhhdmUgdmVyeSBsb3cgZnJhbWUKPiByYXRlIHdoaWxlIG5laXRoZXIgdGhlIENQVSBub3IgdGhl
IEdQVSBhcmUgZnVsbHkgdXRpbGl6ZWQuCgpJcyB0aGF0IHByb2JsZW0gaW4gTGludXggb25seSBv
ciBkbyB5b3Ugc2VlIHRoZSBzYW1lIGlzc3VlIGluIFdpbmRvd3MgYXMKd2VsbD8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
