Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE04E6F06
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 10:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A5E89F8B;
	Mon, 28 Oct 2019 09:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF38689F8B;
 Mon, 28 Oct 2019 09:24:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 02:24:30 -0700
X-IronPort-AV: E=Sophos;i="5.68,239,1569308400"; d="scan'208";a="193204146"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 02:24:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH v2] kernel-doc: rename the kernel-doc directive
 'functions' to 'identifiers'
In-Reply-To: <20191025144802.uixg2crhw6h7gghq@mail.google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191020131717.28990-1-changbin.du@gmail.com>
 <20191024121940.1d6a64df@lwn.net> <87woctb9cj.fsf@intel.com>
 <20191025144802.uixg2crhw6h7gghq@mail.google.com>
Date: Mon, 28 Oct 2019 11:24:22 +0200
Message-ID: <87v9s99q9l.fsf@intel.com>
MIME-Version: 1.0
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
Cc: linux-usb@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-crypto@vger.kernel.org,
 linux-kselftest@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNSBPY3QgMjAxOSwgQ2hhbmdiaW4gRHUgPGNoYW5nYmluLmR1QGdtYWlsLmNvbT4g
d3JvdGU6Cj4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMDk6NTc6NDhBTSArMDMwMCwgSmFuaSBO
aWt1bGEgd3JvdGU6Cj4+IE9uIFRodSwgMjQgT2N0IDIwMTksIEpvbmF0aGFuIENvcmJldCA8Y29y
YmV0QGx3bi5uZXQ+IHdyb3RlOgo+PiA+IE9uIFN1biwgMjAgT2N0IDIwMTkgMjE6MTc6MTcgKzA4
MDAKPj4gPiBDaGFuZ2JpbiBEdSA8Y2hhbmdiaW4uZHVAZ21haWwuY29tPiB3cm90ZToKPj4gPgo+
PiA+PiBUaGUgJ2Z1bmN0aW9ucycgZGlyZWN0aXZlIGlzIG5vdCBvbmx5IGZvciBmdW5jdGlvbnMs
IGJ1dCBhbHNvIHdvcmtzIGZvcgo+PiA+PiBzdHJ1Y3RzL3VuaW9ucy4gU28gdGhlIG5hbWUgaXMg
bWlzbGVhZGluZy4gVGhpcyBwYXRjaCByZW5hbWVzIGl0IHRvCj4+ID4+ICdpZGVudGlmaWVycycs
IHdoaWNoIHNwZWNpZmljIHRoZSBmdW5jdGlvbnMvdHlwZXMgdG8gYmUgaW5jbHVkZWQgaW4KPj4g
Pj4gZG9jdW1lbnRhdGlvbi4gV2Uga2VlcCB0aGUgb2xkIG5hbWUgYXMgYW4gYWxpYXMgb2YgdGhl
IG5ldyBvbmUgYmVmb3JlCj4+ID4+IGFsbCBkb2N1bWVudGF0aW9uIGFyZSB1cGRhdGVkLgo+PiA+
PiAKPj4gPj4gU2lnbmVkLW9mZi1ieTogQ2hhbmdiaW4gRHUgPGNoYW5nYmluLmR1QGdtYWlsLmNv
bT4KPj4gPgo+PiA+IFNvIEkgdGhpbmsgdGhpcyBpcyBiYXNpY2FsbHkgT0ssIGJ1dCBJIGhhdmUg
b25lIG1vcmUgcmVxdWVzdC4uLgo+PiA+Cj4+ID4gWy4uLl0KPj4gPgo+PiA+PiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9zcGhpbngva2VybmVsZG9jLnB5IGIvRG9jdW1lbnRhdGlvbi9zcGhp
bngva2VybmVsZG9jLnB5Cj4+ID4+IGluZGV4IDExNTk0MDVjYjkyMC4uMDY4OWY5YzM3ZjFlIDEw
MDY0NAo+PiA+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL3NwaGlueC9rZXJuZWxkb2MucHkKPj4gPj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9zcGhpbngva2VybmVsZG9jLnB5Cj4+ID4+IEBAIC01OSw5ICs1
OSwxMCBAQCBjbGFzcyBLZXJuZWxEb2NEaXJlY3RpdmUoRGlyZWN0aXZlKToKPj4gPj4gICAgICBv
cHRpb25hbF9hcmd1bWVudHMgPSA0Cj4+ID4+ICAgICAgb3B0aW9uX3NwZWMgPSB7Cj4+ID4+ICAg
ICAgICAgICdkb2MnOiBkaXJlY3RpdmVzLnVuY2hhbmdlZF9yZXF1aXJlZCwKPj4gPj4gLSAgICAg
ICAgJ2Z1bmN0aW9ucyc6IGRpcmVjdGl2ZXMudW5jaGFuZ2VkLAo+PiA+PiAgICAgICAgICAnZXhw
b3J0JzogZGlyZWN0aXZlcy51bmNoYW5nZWQsCj4+ID4+ICAgICAgICAgICdpbnRlcm5hbCc6IGRp
cmVjdGl2ZXMudW5jaGFuZ2VkLAo+PiA+PiArICAgICAgICAnaWRlbnRpZmllcnMnOiBkaXJlY3Rp
dmVzLnVuY2hhbmdlZCwKPj4gPj4gKyAgICAgICAgJ2Z1bmN0aW9ucyc6IGRpcmVjdGl2ZXMudW5j
aGFuZ2VkLCAgIyBhbGlhcyBvZiAnaWRlbnRpZmllcnMnCj4+ID4+ICAgICAgfQo+PiA+PiAgICAg
IGhhc19jb250ZW50ID0gRmFsc2UKPj4gPj4gIAo+PiA+PiBAQCAtNzEsNiArNzIsNyBAQCBjbGFz
cyBLZXJuZWxEb2NEaXJlY3RpdmUoRGlyZWN0aXZlKToKPj4gPj4gIAo+PiA+PiAgICAgICAgICBm
aWxlbmFtZSA9IGVudi5jb25maWcua2VybmVsZG9jX3NyY3RyZWUgKyAnLycgKyBzZWxmLmFyZ3Vt
ZW50c1swXQo+PiA+PiAgICAgICAgICBleHBvcnRfZmlsZV9wYXR0ZXJucyA9IFtdCj4+ID4+ICsg
ICAgICAgIGlkZW50aWZpZXJzID0gTm9uZQo+PiA+PiAgCj4+ID4+ICAgICAgICAgICMgVGVsbCBz
cGhpbnggb2YgdGhlIGRlcGVuZGVuY3kKPj4gPj4gICAgICAgICAgZW52Lm5vdGVfZGVwZW5kZW5j
eShvcy5wYXRoLmFic3BhdGgoZmlsZW5hbWUpKQo+PiA+PiBAQCAtODYsMTkgKzg4LDIyIEBAIGNs
YXNzIEtlcm5lbERvY0RpcmVjdGl2ZShEaXJlY3RpdmUpOgo+PiA+PiAgICAgICAgICAgICAgZXhw
b3J0X2ZpbGVfcGF0dGVybnMgPSBzdHIoc2VsZi5vcHRpb25zLmdldCgnaW50ZXJuYWwnKSkuc3Bs
aXQoKQo+PiA+PiAgICAgICAgICBlbGlmICdkb2MnIGluIHNlbGYub3B0aW9uczoKPj4gPj4gICAg
ICAgICAgICAgIGNtZCArPSBbJy1mdW5jdGlvbicsIHN0cihzZWxmLm9wdGlvbnMuZ2V0KCdkb2Mn
KSldCj4+ID4+ICsgICAgICAgIGVsaWYgJ2lkZW50aWZpZXJzJyBpbiBzZWxmLm9wdGlvbnM6Cj4+
ID4+ICsgICAgICAgICAgICBpZGVudGlmaWVycyA9IHNlbGYub3B0aW9ucy5nZXQoJ2lkZW50aWZp
ZXJzJykuc3BsaXQoKQo+PiA+PiAgICAgICAgICBlbGlmICdmdW5jdGlvbnMnIGluIHNlbGYub3B0
aW9uczoKPj4gPj4gLSAgICAgICAgICAgIGZ1bmN0aW9ucyA9IHNlbGYub3B0aW9ucy5nZXQoJ2Z1
bmN0aW9ucycpLnNwbGl0KCkKPj4gPj4gLSAgICAgICAgICAgIGlmIGZ1bmN0aW9uczoKPj4gPj4g
LSAgICAgICAgICAgICAgICBmb3IgZiBpbiBmdW5jdGlvbnM6Cj4+ID4+IC0gICAgICAgICAgICAg
ICAgICAgIGNtZCArPSBbJy1mdW5jdGlvbicsIGZdCj4+ID4+IC0gICAgICAgICAgICBlbHNlOgo+
PiA+PiAtICAgICAgICAgICAgICAgIGNtZCArPSBbJy1uby1kb2Mtc2VjdGlvbnMnXQo+PiA+PiAr
ICAgICAgICAgICAgaWRlbnRpZmllcnMgPSBzZWxmLm9wdGlvbnMuZ2V0KCdmdW5jdGlvbnMnKS5z
cGxpdCgpCj4+ID4KPj4gPiBSYXRoZXIgdGhhbiBkbyB0aGlzLCBjYW4geW91IGp1c3QgY2hhbmdl
IHRoZSBlbGlmIGxpbmUgdG8gcmVhZDoKPj4gPgo+PiA+ICAgICBlbGlmICgnaWRlbnRpZmllcnMn
IGluIHNlbGYub3B0aW9ucykgb3IgKCdmdW5jdGlvbnMnIGluIHNlbGYub3B0aW9ucyk6Cj4+ID4K
Pj4gPiAuLi50aGVuIGxlYXZlIHRoZSByZXN0IG9mIHRoZSBjb2RlIGludGFjdD8gIEl0IGtlZXBz
IHRoZSBsb2dpYyB0b2dldGhlciwKPj4gPiBhbmQgYXZvaWRzIHRoZSBjb25mdXNpbmcgZGlzdGlu
Y3Rpb24gYmV0d2VlbiBpZGVudGlmaWVycz09JycgYW5kCj4+ID4gaWRlbnRpZmllcnM9PU5vbmUg
Lgo+PiAKPj4gSSB0aGluayB0aGUgcHJvYmxlbSBpcyB5b3Ugc3RpbGwgbmVlZCB0byBkaXN0aW5n
dWlzaCBiZXR3ZWVuIHRoZSB0d28gZm9yCj4+IHRoZSBnZXQoJ2Z1bmN0aW9ucycpIHBhcnQuCj4+
IAo+PiBPbmUgb3B0aW9uIGlzIHRvIHJlbmFtZSAnZnVuY3Rpb25zJyB0byAnaWRlbnRpZmllcnMn
IGluIHRoZSBhYm92ZSBibG9jaywKPj4gYW5kIHB1dCBzb21ldGhpbmcgbGlrZSB0aGlzIGFib3Zl
IHRoZSB3aG9sZSBpZiBsYWRkZXIgKHVudGVzdGVkKToKPj4gCj4+ICAgICAgICAgIyBiYWNrd2Fy
ZCBjb21wYXQKPj4gICAgICAgICBpZiAnZnVuY3Rpb25zJyBpbiBzZWxmLm9wdGlvbnM6Cj4+ICAg
ICAgICAgICAgIGlmICdpZGVudGlmaWVycycgaW4gc2VsZi5vcHRpb25zOgo+PiAgICAgICAgICAg
ICAgICAga2VybmVsbG9nLndhcm4oZW52LmFwcCwgImZhaWwiKQo+IFRoaXMgd2lsbCBtaXNzIHRo
ZSBjb250ZW50IG9mICdmdW5jdGlvbnMnIGRpcmVjdGl2ZSBpZiBib3RoIGV4aXN0IGluCj4gc2Ft
ZSBkb2MuCgpEaWQgeW91IG5vdCBub3RpY2UgeW91ciBwYXRjaCBkb2VzIHRoZSBzYW1lLCBleGNl
cHQgc2lsZW50bHksIHdoaWxlIHRoaXMKd291bGQgcHJvZHVjZSBhIHdhcm5pbmc/IFdoaWNoIG9u
ZSBpcyBsZXNzIHN1cnByaXNpbmc/Cgo+Cj4+ICAgICAgICAgICAgIGVsc2U6Cj4+ICAgICAgICAg
ICAgICAgICBzZWxmLm9wdGlvbnMuc2V0KCdpZGVudGlmaWVycycsIHNlbGYub3B0aW9ucy5nZXQo
J2Z1bmN0aW9ucycpKQo+PiAKPj4gQlIsCj4+IEphbmkuCj4+Cj4gQWZ0ZXIgY29tcGFyaW5nLCBJ
IHN0aWxsIHBlcmZlciBteSBvcmlnaW5hbCBjb2RlIHdoaWNoIGlzIHNpbXBsZXIuIDopCgpCdXQg
aXMgaXQsIHJlYWxseT8gSSBhZ3JlZSB3aXRoIEpvbiBhYm91dCB0aGUgZGlzdGluY3Rpb24gYmV0
d2VlbiBOb25lCmFuZCAnJyBiZWluZyBjb25mdXNpbmcuCgoKQlIsCkphbmkuCgoKCj4KPj4gCj4+
IC0tIAo+PiBKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCgot
LSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
