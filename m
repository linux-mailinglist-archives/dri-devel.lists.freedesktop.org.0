Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEDFE43DC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 08:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF546E8AF;
	Fri, 25 Oct 2019 06:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6786E8AF;
 Fri, 25 Oct 2019 06:58:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 23:58:03 -0700
X-IronPort-AV: E=Sophos;i="5.68,227,1569308400"; d="scan'208";a="192446754"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 23:57:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>, Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH v2] kernel-doc: rename the kernel-doc directive
 'functions' to 'identifiers'
In-Reply-To: <20191024121940.1d6a64df@lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191020131717.28990-1-changbin.du@gmail.com>
 <20191024121940.1d6a64df@lwn.net>
Date: Fri, 25 Oct 2019 09:57:48 +0300
Message-ID: <87woctb9cj.fsf@intel.com>
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-crypto@vger.kernel.org,
 linux-kselftest@vger.kernel.org, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNCBPY3QgMjAxOSwgSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD4gd3Jv
dGU6Cj4gT24gU3VuLCAyMCBPY3QgMjAxOSAyMToxNzoxNyArMDgwMAo+IENoYW5nYmluIER1IDxj
aGFuZ2Jpbi5kdUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4+IFRoZSAnZnVuY3Rpb25zJyBkaXJlY3Rp
dmUgaXMgbm90IG9ubHkgZm9yIGZ1bmN0aW9ucywgYnV0IGFsc28gd29ya3MgZm9yCj4+IHN0cnVj
dHMvdW5pb25zLiBTbyB0aGUgbmFtZSBpcyBtaXNsZWFkaW5nLiBUaGlzIHBhdGNoIHJlbmFtZXMg
aXQgdG8KPj4gJ2lkZW50aWZpZXJzJywgd2hpY2ggc3BlY2lmaWMgdGhlIGZ1bmN0aW9ucy90eXBl
cyB0byBiZSBpbmNsdWRlZCBpbgo+PiBkb2N1bWVudGF0aW9uLiBXZSBrZWVwIHRoZSBvbGQgbmFt
ZSBhcyBhbiBhbGlhcyBvZiB0aGUgbmV3IG9uZSBiZWZvcmUKPj4gYWxsIGRvY3VtZW50YXRpb24g
YXJlIHVwZGF0ZWQuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ2JpbiBEdSA8Y2hhbmdiaW4u
ZHVAZ21haWwuY29tPgo+Cj4gU28gSSB0aGluayB0aGlzIGlzIGJhc2ljYWxseSBPSywgYnV0IEkg
aGF2ZSBvbmUgbW9yZSByZXF1ZXN0Li4uCj4KPiBbLi4uXQo+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL3NwaGlueC9rZXJuZWxkb2MucHkgYi9Eb2N1bWVudGF0aW9uL3NwaGlueC9rZXJu
ZWxkb2MucHkKPj4gaW5kZXggMTE1OTQwNWNiOTIwLi4wNjg5ZjljMzdmMWUgMTAwNjQ0Cj4+IC0t
LSBhL0RvY3VtZW50YXRpb24vc3BoaW54L2tlcm5lbGRvYy5weQo+PiArKysgYi9Eb2N1bWVudGF0
aW9uL3NwaGlueC9rZXJuZWxkb2MucHkKPj4gQEAgLTU5LDkgKzU5LDEwIEBAIGNsYXNzIEtlcm5l
bERvY0RpcmVjdGl2ZShEaXJlY3RpdmUpOgo+PiAgICAgIG9wdGlvbmFsX2FyZ3VtZW50cyA9IDQK
Pj4gICAgICBvcHRpb25fc3BlYyA9IHsKPj4gICAgICAgICAgJ2RvYyc6IGRpcmVjdGl2ZXMudW5j
aGFuZ2VkX3JlcXVpcmVkLAo+PiAtICAgICAgICAnZnVuY3Rpb25zJzogZGlyZWN0aXZlcy51bmNo
YW5nZWQsCj4+ICAgICAgICAgICdleHBvcnQnOiBkaXJlY3RpdmVzLnVuY2hhbmdlZCwKPj4gICAg
ICAgICAgJ2ludGVybmFsJzogZGlyZWN0aXZlcy51bmNoYW5nZWQsCj4+ICsgICAgICAgICdpZGVu
dGlmaWVycyc6IGRpcmVjdGl2ZXMudW5jaGFuZ2VkLAo+PiArICAgICAgICAnZnVuY3Rpb25zJzog
ZGlyZWN0aXZlcy51bmNoYW5nZWQsICAjIGFsaWFzIG9mICdpZGVudGlmaWVycycKPj4gICAgICB9
Cj4+ICAgICAgaGFzX2NvbnRlbnQgPSBGYWxzZQo+PiAgCj4+IEBAIC03MSw2ICs3Miw3IEBAIGNs
YXNzIEtlcm5lbERvY0RpcmVjdGl2ZShEaXJlY3RpdmUpOgo+PiAgCj4+ICAgICAgICAgIGZpbGVu
YW1lID0gZW52LmNvbmZpZy5rZXJuZWxkb2Nfc3JjdHJlZSArICcvJyArIHNlbGYuYXJndW1lbnRz
WzBdCj4+ICAgICAgICAgIGV4cG9ydF9maWxlX3BhdHRlcm5zID0gW10KPj4gKyAgICAgICAgaWRl
bnRpZmllcnMgPSBOb25lCj4+ICAKPj4gICAgICAgICAgIyBUZWxsIHNwaGlueCBvZiB0aGUgZGVw
ZW5kZW5jeQo+PiAgICAgICAgICBlbnYubm90ZV9kZXBlbmRlbmN5KG9zLnBhdGguYWJzcGF0aChm
aWxlbmFtZSkpCj4+IEBAIC04NiwxOSArODgsMjIgQEAgY2xhc3MgS2VybmVsRG9jRGlyZWN0aXZl
KERpcmVjdGl2ZSk6Cj4+ICAgICAgICAgICAgICBleHBvcnRfZmlsZV9wYXR0ZXJucyA9IHN0cihz
ZWxmLm9wdGlvbnMuZ2V0KCdpbnRlcm5hbCcpKS5zcGxpdCgpCj4+ICAgICAgICAgIGVsaWYgJ2Rv
YycgaW4gc2VsZi5vcHRpb25zOgo+PiAgICAgICAgICAgICAgY21kICs9IFsnLWZ1bmN0aW9uJywg
c3RyKHNlbGYub3B0aW9ucy5nZXQoJ2RvYycpKV0KPj4gKyAgICAgICAgZWxpZiAnaWRlbnRpZmll
cnMnIGluIHNlbGYub3B0aW9uczoKPj4gKyAgICAgICAgICAgIGlkZW50aWZpZXJzID0gc2VsZi5v
cHRpb25zLmdldCgnaWRlbnRpZmllcnMnKS5zcGxpdCgpCj4+ICAgICAgICAgIGVsaWYgJ2Z1bmN0
aW9ucycgaW4gc2VsZi5vcHRpb25zOgo+PiAtICAgICAgICAgICAgZnVuY3Rpb25zID0gc2VsZi5v
cHRpb25zLmdldCgnZnVuY3Rpb25zJykuc3BsaXQoKQo+PiAtICAgICAgICAgICAgaWYgZnVuY3Rp
b25zOgo+PiAtICAgICAgICAgICAgICAgIGZvciBmIGluIGZ1bmN0aW9uczoKPj4gLSAgICAgICAg
ICAgICAgICAgICAgY21kICs9IFsnLWZ1bmN0aW9uJywgZl0KPj4gLSAgICAgICAgICAgIGVsc2U6
Cj4+IC0gICAgICAgICAgICAgICAgY21kICs9IFsnLW5vLWRvYy1zZWN0aW9ucyddCj4+ICsgICAg
ICAgICAgICBpZGVudGlmaWVycyA9IHNlbGYub3B0aW9ucy5nZXQoJ2Z1bmN0aW9ucycpLnNwbGl0
KCkKPgo+IFJhdGhlciB0aGFuIGRvIHRoaXMsIGNhbiB5b3UganVzdCBjaGFuZ2UgdGhlIGVsaWYg
bGluZSB0byByZWFkOgo+Cj4gICAgIGVsaWYgKCdpZGVudGlmaWVycycgaW4gc2VsZi5vcHRpb25z
KSBvciAoJ2Z1bmN0aW9ucycgaW4gc2VsZi5vcHRpb25zKToKPgo+IC4uLnRoZW4gbGVhdmUgdGhl
IHJlc3Qgb2YgdGhlIGNvZGUgaW50YWN0PyAgSXQga2VlcHMgdGhlIGxvZ2ljIHRvZ2V0aGVyLAo+
IGFuZCBhdm9pZHMgdGhlIGNvbmZ1c2luZyBkaXN0aW5jdGlvbiBiZXR3ZWVuIGlkZW50aWZpZXJz
PT0nJyBhbmQKPiBpZGVudGlmaWVycz09Tm9uZSAuCgpJIHRoaW5rIHRoZSBwcm9ibGVtIGlzIHlv
dSBzdGlsbCBuZWVkIHRvIGRpc3Rpbmd1aXNoIGJldHdlZW4gdGhlIHR3byBmb3IKdGhlIGdldCgn
ZnVuY3Rpb25zJykgcGFydC4KCk9uZSBvcHRpb24gaXMgdG8gcmVuYW1lICdmdW5jdGlvbnMnIHRv
ICdpZGVudGlmaWVycycgaW4gdGhlIGFib3ZlIGJsb2NrLAphbmQgcHV0IHNvbWV0aGluZyBsaWtl
IHRoaXMgYWJvdmUgdGhlIHdob2xlIGlmIGxhZGRlciAodW50ZXN0ZWQpOgoKICAgICAgICAjIGJh
Y2t3YXJkIGNvbXBhdAogICAgICAgIGlmICdmdW5jdGlvbnMnIGluIHNlbGYub3B0aW9uczoKICAg
ICAgICAgICAgaWYgJ2lkZW50aWZpZXJzJyBpbiBzZWxmLm9wdGlvbnM6CiAgICAgICAgICAgICAg
ICBrZXJuZWxsb2cud2FybihlbnYuYXBwLCAiZmFpbCIpCiAgICAgICAgICAgIGVsc2U6CiAgICAg
ICAgICAgICAgICBzZWxmLm9wdGlvbnMuc2V0KCdpZGVudGlmaWVycycsIHNlbGYub3B0aW9ucy5n
ZXQoJ2Z1bmN0aW9ucycpKQoKQlIsCkphbmkuCgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVu
IFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
