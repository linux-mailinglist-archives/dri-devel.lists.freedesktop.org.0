Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD7117DB02
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFDB6E330;
	Mon,  9 Mar 2020 08:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547006E2E3;
 Mon,  9 Mar 2020 08:35:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 01:35:43 -0700
X-IronPort-AV: E=Sophos;i="5.70,532,1574150400"; d="scan'208";a="245280212"
Received: from memara-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.39.218])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 01:35:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 1/2] drm/edid: Name the detailed monitor
 range flags
In-Reply-To: <20200306184048.GA25133@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200306014220.20029-1-manasi.d.navare@intel.com>
 <87mu8tojvt.fsf@intel.com> <20200306184048.GA25133@intel.com>
Date: Mon, 09 Mar 2020 10:35:52 +0200
Message-ID: <87h7yylyc7.fsf@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: intel-gfx@lists.freedesktop.org,
 Kazlauskas Nicholas <Nicholas.Kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwNiBNYXIgMjAyMCwgTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVs
LmNvbT4gd3JvdGU6Cj4gT24gRnJpLCBNYXIgMDYsIDIwMjAgYXQgMTI6MzA6NDZQTSArMDIwMCwg
SmFuaSBOaWt1bGEgd3JvdGU6Cj4+IE9uIFRodSwgMDUgTWFyIDIwMjAsIE1hbmFzaSBOYXZhcmUg
PG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+IHdyb3RlOgo+PiA+IFRoaXMgcGF0Y2ggYWRkcyBk
ZWZpbmVzIGZvciB0aGUgZGV0YWlsZWQgbW9uaXRvcgo+PiA+IHJhbmdlIGZsYWdzIGFzIHBlciB0
aGUgRURJRCBzcGVjaWZpY2F0aW9uLgo+PiA+Cj4+ID4gU3VnZ2VzdGVkLWJ5OiBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+PiA+IENjOiBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+PiA+IENjOiBIYXJyeSBXZW50
bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPj4gPiBDYzogQ2xpbnRvbiBBIFRheWxvciA8
Y2xpbnRvbi5hLnRheWxvckBpbnRlbC5jb20+Cj4+ID4gQ2M6IEthemxhdXNrYXMgTmljaG9sYXMg
PE5pY2hvbGFzLkthemxhdXNrYXNAYW1kLmNvbT4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBNYW5hc2kg
TmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29tPgo+PiA+IC0tLQo+PiA+ICBpbmNsdWRl
L2RybS9kcm1fZWRpZC5oIHwgNSArKysrKwo+PiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspCj4+ID4KPj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2VkaWQuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9lZGlkLmgKPj4gPiBpbmRleCBmMGIwM2Q0MDFjMjcuLmY4OWM5NzYyMzg0
NSAxMDA2NDQKPj4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZWRpZC5oCj4+ID4gKysrIGIvaW5j
bHVkZS9kcm0vZHJtX2VkaWQuaAo+PiA+IEBAIC05MSw2ICs5MSwxMSBAQCBzdHJ1Y3QgZGV0YWls
ZWRfZGF0YV9zdHJpbmcgewo+PiA+ICAJdTggc3RyWzEzXTsKPj4gPiAgfSBfX2F0dHJpYnV0ZV9f
KChwYWNrZWQpKTsKPj4gPiAgCj4+ID4gKyNkZWZpbmUgRURJRF9ERUZBVUxUX0dURl9TVVBQT1JU
X0ZMQUcgICAweDAwCj4+ID4gKyNkZWZpbmUgRURJRF9SQU5HRV9MSU1JVFNfT05MWV9GTEFHICAg
ICAweDAxCj4+ID4gKyNkZWZpbmUgRURJRF9TRUNPTkRBUllfR1RGX1NVUFBPUlRfRkxBRyAweDAy
Cj4+ID4gKyNkZWZpbmUgRURJRF9DVlRfU1VQUE9SVF9GTEFHICAgICAgICAgICAweDA0Cj4+IAo+
PiBCaWtlc2hlZCBmb3IgY29uc2lkZXJhdGlvbjoKPj4gCj4+IGRybV9lZGlkLmggaGFzIHNvbWUg
bWFjcm9zIHdpdGggRFJNX0VESURfIHByZWZpeCwgc29tZSB3aXRoIEVESURfCj4+IHByZWZpeCwg
YW5kIHRoZW4gc29tZSB3aXRoIG5vIHByZWZpeCBhdCBhbGwgcmVhbGx5LiBTaG91bGQgd2Ugc3Rh
cnQKPj4gY29uc29saWRhdGluZyBvbiBzb21ldGhpbmcgd2hlbiB3ZSBhZGQgbW9yZT8KPj4KPgo+
IFllcyBKYW5pIEkgZGlkIG5vdGljZSB0aGUgc2FtZSB0aGluZyBhbmQgZGlkbnQga25vdyB3aGlj
aCBjb252ZW50aW9uCj4gdG8gY29udGludWUgdG8gZm9sbG93IGJ1dCBJIG5vdGljZWQgdGhhdCBt
YWpvcml0eSBvZiB0aGUgZGVmaW5lcyB3ZXJlCj4ganVzdCBFRElEXyBzbyBqdXN0IHVzZWQgdGhh
dCBmb3IgdGhlc2UgbmV3IGRlZmluZXMuCgpBaCwgbG9vayBhZ2FpbiwgRFJNX0VESURfIHRydW1w
cyBFRElEXyA1MSB0byAxNS4KCj4gSXMgdGhlcmUgYSBwYXJ0aWN1bGFyIHdheSB5b3Ugd2lzaCB0
byBjb25zb2xpZGF0ZSB0aGlzIGFuZCB1c2UgYSBzcGVjaWZpYwo+IGNvbnZlbnRpb24gZm9yICNk
ZWZpbmVzPwo+Cj4gSSBjYW4gYXRsZWFzdCBjaGFuZ2UgdGhlc2UgbmV3IGRlZmluZXMgYmFzZWQg
b24gYSBwcmVmZXJyZWQgY29udmVudGlvbiBhbmQgdGhlbgo+IHNlcGFyYXRlIHBhdGNoZXMgdG8g
Y2hhbmdlIHRoZSByZXN0IGluIC5oIGFuZCBjb3JyZXNwb25kaW5nIHVzYWdlcyBpbiAuYyBmaWxl
cy4KCkknZCBzdWdnZXN0IERSTV9FRElEXyBmb3IgbmV3IG9uZXMsIHBlcmhhcHMgZXZlbnR1YWxs
eSByZW5hbWUgb2xkIG9uZXMuCgpCUiwKSmFuaS4KCgo+Cj4gUmVnYXJkcwo+IE1hbmFzaQo+ICAK
Pj4gQlIsCj4+IEphbmkuCj4+IAo+PiAKPj4gPiArCj4+ID4gIHN0cnVjdCBkZXRhaWxlZF9kYXRh
X21vbml0b3JfcmFuZ2Ugewo+PiA+ICAJdTggbWluX3ZmcmVxOwo+PiA+ICAJdTggbWF4X3ZmcmVx
Owo+PiAKPj4gLS0gCj4+IEphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBD
ZW50ZXIKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVy
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
