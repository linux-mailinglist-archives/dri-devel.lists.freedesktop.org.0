Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F64B20F7EB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 17:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7656E2E4;
	Tue, 30 Jun 2020 15:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061AC6E2E4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 15:08:55 +0000 (UTC)
IronPort-SDR: IKt6c+Pz+FGWDd+7WGI27LfIXzjaQaGD3MRoWdIRuoily19Xji1zmilpK7IgS06NT8/PQascGY
 lZiiPtjX90SA==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="164264616"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="164264616"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 08:08:00 -0700
IronPort-SDR: x/GNkWcl1Y9/QYeBvnYXehDtu53qPSERRWxupR9xVwLSSj0PxUrEfi7mWhVJ0dtZtOvP583wm1
 wiey+dGMsVWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="265139464"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 30 Jun 2020 08:07:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 30 Jun 2020 18:07:57 +0300
Date: Tue, 30 Jun 2020 18:07:57 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: warning in omap_connector
Message-ID: <20200630150757.GH6112@intel.com>
References: <CAPM=9tz7E5rmRdqWwGQCsS+q+UcPU7XTxsGgkCggQXA8ktn0pw@mail.gmail.com>
 <20200630141505.GE6112@intel.com>
 <CADnq5_PdqNjD2OnWGWJxv-Q-YUN4ymLUxTdT9km_ESS2cwm68A@mail.gmail.com>
 <20200630143902.GG6112@intel.com>
 <20200630144132.GH5850@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630144132.GH5850@pendragon.ideasonboard.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMzAsIDIwMjAgYXQgMDU6NDE6MzJQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBWaWxsZSwKPiAKPiBPbiBUdWUsIEp1biAzMCwgMjAyMCBhdCAwNTozOTow
MlBNICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAzMCwgMjAy
MCBhdCAxMDoxOToyM0FNIC0wNDAwLCBBbGV4IERldWNoZXIgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwg
SnVuIDMwLCAyMDIwIGF0IDEwOjE1IEFNIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiA+ID4gPgo+
ID4gPiA+IE9uIFR1ZSwgSnVuIDMwLCAyMDIwIGF0IDA0OjMzOjM3UE0gKzEwMDAsIERhdmUgQWly
bGllIHdyb3RlOgo+ID4gPiA+ID4gSGV5IExhdXJlbnQsCj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBt
ZXJnZWQgZHJtLW1pc2MtbmV4dCBhbmQgbm90aWNlZCB0aGlzLCBJJ20gbm90IHN1cmUgaWYgaXQn
cwo+ID4gPiA+ID4gY29sbGF0ZXJhbCBkYW1hZ2UgZnJvbSBzb21ldGhpbmcgZWxzZSBjaGFuZ2lu
ZyBvciBJJ3ZlIGp1c3QgbWlzc2VkIGl0Cj4gPiA+ID4gPiBwcmV2aW91c2x5LiAzMi1iaXQgYXJt
IGJ1aWxkLgo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiAvaG9tZS9haXJsaWVkL2RldmVs
L2tlcm5lbC9kaW0vc3JjL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY29ubmVjdG9yLmM6
Cj4gPiA+ID4gPiBJbiBmdW5jdGlvbiDigJhvbWFwX2Nvbm5lY3Rvcl9tb2RlX3ZhbGlk4oCZOgo+
ID4gPiA+ID4gL2hvbWUvYWlybGllZC9kZXZlbC9rZXJuZWwvZGltL3NyYy9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9vbWFwX2Nvbm5lY3Rvci5jOjkyOjk6Cj4gPiA+ID4gPiB3YXJuaW5nOiBicmFj
ZXMgYXJvdW5kIHNjYWxhciBpbml0aWFsaXplcgo+ID4gPiA+ID4gICBzdHJ1Y3QgZHJtX2Rpc3Bs
YXlfbW9kZSBuZXdfbW9kZSA9IHsgeyAwIH0gfTsKPiA+ID4gPgo+ID4gPiA+IFByb2JhYmx5IGZh
bGxvdXQgZnJvbSBteSBkcm1fZGlzcGxheV9tb2RlIHNocmlua2FnZS4KPiA+ID4gPgo+ID4gPiA+
IEdvaW5nIHRvIHJlcGVhdCBteSB1c3VhbCAianVzdCB1c2Uge30gd2hlbiB6ZXJvIGluaXRpYWxp
emluZwo+ID4gPiA+IHN0cnVjdHMiIHJlY29tbWVuZGF0aW9uLiBBdm9pZHMgdGhlc2Ugc3R1cGlk
IHdhcm5pbmdzLCBhbmQgSU1PCj4gPiA+ID4gYWxzbyBjb252ZXlzIHRoZSBtZWFuaW5nIGJldHRl
ciBzaW5jZSB0aGVyZSdzIG5vIGFtYmlndWl0eQo+ID4gPiA+IGJldHdlZW4gemVybyBpbml0aWFs
aXppbmcgdGhlIHdob2xlIHN0cnVjdCB2cy4gemVybyBpbml0aWFsaXppbmcKPiA+ID4gPiBqdXN0
IHRoZSBmaXJzdCBtZW1iZXIuCj4gPiA+IAo+ID4gPiBJSVJDLCBMTFZNIGFuZCBHQ0MgdHJlYXQg
dGhlc2Ugc2xpZ2h0bHkgZGlmZmVyZW50bHkuICBXZSd2ZSBnZW5lcmFsbHkKPiA+ID4ganVzdCBt
b3ZlZCB0byB1c2luZyBtZW1zZXQgdG8gYXZvaWQgZGlmZmVyZW50IGNvbXBpbGVyIGNvbXBsYWlu
dHMgd2hlbgo+ID4gPiB1c2luZyB0aGVzZS4KPiA+IAo+ID4gSSBkb24ndCBwYXJ0aWN1bGFybHkg
bGlrZSBtZW1zZXQoKSBzaW5jZSB0aGUgcmVxdWlyZW1lbnQgdG8KPiA+IHBhc3MgdGhlIHNpemUg
anVzdCBhZGRzIGFub3RoZXIgd2F5IHRvIHNjcmV3IHRoaW5ncyB1cC4gVGhlCj4gPiB1c3VhbCAn
c2l6ZW9mKCp0aGluZyknIG1ha2VzIHRoYXQgc2xpZ2h0bHkgbGVzcyBvZiBhbiBpc3N1ZSwKPiA+
IGJ1dCBJJ3ZlIG5vdGljZWQgdGhhdCBwZW9wbGUgb2Z0ZW4gZG9uJ3QgdXNlIHRoYXQuCj4gPiAK
PiA+IEFub3RoZXIgaXNzdWUgd2l0aCBtZW1zZXQoKSBpcyB0aGF0IHlvdSB0aGVuIGNhbiBlbmQg
dXAgd2l0aAo+ID4gYSBibG9jayBvZiBzZWVtaW5nbHkgcmFuZG9tIGNvbGxlY3Rpb24gb2YgbWVt
c2V0cygpcyBiZXR3ZWVuCj4gPiB0aGUgdmFyaWFibGUgZGVjbGFyYXRpb25zIGFuZCB0aGUgcmVz
dCBvZiB0aGUgY29kZS4gSSBzdXBwb3NlCj4gPiBpZiB3ZSBjb3VsZCBkZWNsYXJlIHZhcmlhYmxl
cyBhbnl3aGVyZSB3ZSBjb3VsZCBhbHdheXMga2VlcAo+ID4gdGhlIHR3byB0b2dldGhlciBzbyBp
dCB3b3VsZG4ndCBsb29rIHNvIHdlaXJkLCBidXQgY2FuJ3QgZG8KPiA+IHRoYXQgZm9yIHRoZSB0
aW1lIGJlaW5nLiBBbmQgZXZlbiB3aXRoIHRoYXQgaXQgd291bGQgc3RpbGwKPiA+IGxlYWQgdG8g
bGVzcyBzdWNjaW5jdCBjb2RlLCB3aGljaCBJIGdlbmVyYWxseSBkaXNsaWtlLgo+IAo+IEknZCBw
cmVmZXIgeyB9IG92ZXIgbWVtc2V0LCBhc3N1bWluZyBjbGFuZyBhbmQgZ2NjIHdvdWxkIHRyZWF0
IGl0Cj4gY29ycmVjdGx5LiBWaWxsZSwgSSBjYW4gc3VibWl0IGEgcGF0Y2gsIHVubGVzcyB5b3Ug
d2FudCB0byBkbyBpdAo+IHlvdXJzZWxmIGFzIGl0J3MgYSBmYWxsb3V0IGZyb20gZHJtX2Rpc3Bs
YXlfbW9kZSBzaHJpbmthZ2UgOy0pCj4gKHNlcmlvdXNseSBzcGVha2luZywgbm90IHB1c2hpbmcg
eW91LCBJIGp1c3Qgd2FudCB0byBhdm9pZCBkdXBsaWNhdGluZwo+IHdvcmspLgoKR28gYWhlYWQg
aWYgeW91IHdhbnQgdG8uIEknbSBpbiBtaWRkbGUgb2YgYSBiaWdnZXIgcmViYXNlIGF0bQpzbyBj
YW4ndCBkbyBpdCByaWdodCB0aGlzIG1pbnV0ZSBteXNlbGYuCgotLSAKVmlsbGUgU3lyasOkbMOk
CkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
