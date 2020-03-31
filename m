Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76292199BF4
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 18:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6447B6E861;
	Tue, 31 Mar 2020 16:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E596E864
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 16:44:43 +0000 (UTC)
IronPort-SDR: BsATri4/7HN/8Dhal0S5p33CR4flhZ4Q5pWLTXJgl1bbx/fhgp2WNTrqFu/GSXaPK6vHF3Vyy/
 9Crfo9m3AlAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 09:44:43 -0700
IronPort-SDR: Yv2XLVL9NoY0yx/qCsJOio8EPtiOlZJhK5iuaSN3Ppl8ljl283+/+MwkzQuTWwAUPRG6heV2ck
 542wuxKkjzDQ==
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; d="scan'208";a="422360562"
Received: from unknown (HELO localhost) ([10.249.38.166])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 09:44:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: David =?utf-8?Q?Santamar=C3=ADa?= Rogado <howl.nsp@gmail.com>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Thierry Reding
 <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: panel-orientation-quirks: 320 FHD and D330 HD
In-Reply-To: <CAD4j4=AdUtyoiwenzT5moAdHcR_maM91kJfDQM0AuT2bnM=D9Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190730194911.28453-1-howl.nsp@gmail.com>
 <CAD4j4=AdUtyoiwenzT5moAdHcR_maM91kJfDQM0AuT2bnM=D9Q@mail.gmail.com>
Date: Tue, 31 Mar 2020 19:44:37 +0300
Message-ID: <87lfngfp8q.fsf@intel.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNyBNYXIgMjAyMCwgRGF2aWQgU2FudGFtYXLDrWEgUm9nYWRvIDxob3dsLm5zcEBn
bWFpbC5jb20+IHdyb3RlOgo+IFRoaXMgcGF0Y2ggaXMgc3RpbGwgdmFsaWQgYXMgbm8gY2hhbmdl
cyB0byBwYW5lbCBvcmllbnRhdGlvbiBxdWlya3MKPiBoYXZlIGJlZW4gZG9uZS4gU29tZW9uZSBj
YW4gcmV2aWV3IHRoaXMgdG8gbWVyZ2U/CgpDYzogSGFucy4KCj4KPiBFbCBtYXIuLCAzMCBqdWwu
IDIwMTkgYSBsYXMgMjE6NDksIERhdmlkIFNhbnRhbWFyw61hIFJvZ2Fkbwo+ICg8aG93bC5uc3BA
Z21haWwuY29tPikgZXNjcmliacOzOgo+Pgo+PiBUaGlzIGFkZHMgdGhlIEhEIHZlcnNpb24gb2Yg
TGVub3ZvIElkZWFwYWQgRDMzMAo+PiBhbmQgRkhEIHZlcnNpb24gb2YgTGVub3ZvIElkZWFwYWQg
TWlpeCAzMjAuCj4+Cj4+IFRoaXMgc2hvdWxkIHdvcmsgZGVzcGl0ZSB0aGUgZG1pIGRhdGEgaXMg
dGhlIHNhbWUgYmVjYXVzZQo+PiB0aGUgcmVzb2x1dGlvbiBjaGVja3MuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IERhdmlkIFNhbnRhbWFyw61hIFJvZ2FkbyA8aG93bC5uc3BAZ21haWwuY29tPgo+PiAt
LS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMgfCAx
OCArKysrKysrKysrKysrKysrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9w
YW5lbF9vcmllbnRhdGlvbl9xdWlya3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3Jp
ZW50YXRpb25fcXVpcmtzLmMKPj4gaW5kZXggZmZkOTViZmVhYTk0Li44OTZjNzgzY2UxMzUgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtz
LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3Mu
Ywo+PiBAQCAtMTkxLDE0ICsxOTEsMjggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVt
X2lkIG9yaWVudGF0aW9uX2RhdGFbXSA9IHsKPj4gICAgICAgICAgICAgICAgICAgRE1JX0VYQUNU
X01BVENIKERNSV9QUk9EVUNUX1ZFUlNJT04sICJNSUlYIDMxMC0xMElDUiIpLAo+PiAgICAgICAg
ICAgICAgICAgfSwKPj4gICAgICAgICAgICAgICAgIC5kcml2ZXJfZGF0YSA9ICh2b2lkICopJmxj
ZDgwMHgxMjgwX3JpZ2h0c2lkZV91cCwKPj4gLSAgICAgICB9LCB7ICAgIC8qIExlbm92byBJZGVh
cGFkIE1paXggMzIwICovCj4+ICsgICAgICAgfSwgeyAgICAvKiBMZW5vdm8gSWRlYXBhZCBNaWl4
IDMyMCAoSEQpICovCj4+ICAgICAgICAgICAgICAgICAubWF0Y2hlcyA9IHsKPj4gICAgICAgICAg
ICAgICAgICAgRE1JX0VYQUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAiTEVOT1ZPIiksCj4+ICAg
ICAgICAgICAgICAgICAgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiODBYRiIp
LAo+PiAgICAgICAgICAgICAgICAgICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfVkVSU0lP
TiwgIkxlbm92byBNSUlYIDMyMC0xMElDUiIpLAo+PiAgICAgICAgICAgICAgICAgfSwKPj4gICAg
ICAgICAgICAgICAgIC5kcml2ZXJfZGF0YSA9ICh2b2lkICopJmxjZDgwMHgxMjgwX3JpZ2h0c2lk
ZV91cCwKPj4gLSAgICAgICB9LCB7ICAgIC8qIExlbm92byBJZGVhcGFkIEQzMzAgKi8KPj4gKyAg
ICAgICB9LCB7ICAgIC8qIExlbm92byBJZGVhcGFkIE1paXggMzIwIChGSEQpICovCj4+ICsgICAg
ICAgICAgICAgICAubWF0Y2hlcyA9IHsKPj4gKyAgICAgICAgICAgICAgICAgRE1JX0VYQUNUX01B
VENIKERNSV9TWVNfVkVORE9SLCAiTEVOT1ZPIiksCj4+ICsgICAgICAgICAgICAgICAgIERNSV9F
WEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiODBYRiIpLAo+PiArICAgICAgICAgICAgICAg
ICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfVkVSU0lPTiwgIkxlbm92byBNSUlYIDMyMC0x
MElDUiIpLAo+PiArICAgICAgICAgICAgICAgfSwKPj4gKyAgICAgICAgICAgICAgIC5kcml2ZXJf
ZGF0YSA9ICh2b2lkICopJmxjZDEyMDB4MTkyMF9yaWdodHNpZGVfdXAsCj4+ICsgICAgICAgfSwg
eyAgICAvKiBMZW5vdm8gSWRlYXBhZCBEMzMwIChIRCkgKi8KPj4gKyAgICAgICAgICAgICAgIC5t
YXRjaGVzID0gewo+PiArICAgICAgICAgICAgICAgICBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19W
RU5ET1IsICJMRU5PVk8iKSwKPj4gKyAgICAgICAgICAgICAgICAgRE1JX0VYQUNUX01BVENIKERN
SV9QUk9EVUNUX05BTUUsICI4MUgzIiksCj4+ICsgICAgICAgICAgICAgICAgIERNSV9FWEFDVF9N
QVRDSChETUlfUFJPRFVDVF9WRVJTSU9OLCAiTGVub3ZvIGlkZWFwYWQgRDMzMC0xMElHTSIpLAo+
PiArICAgICAgICAgICAgICAgfSwKPj4gKyAgICAgICAgICAgICAgIC5kcml2ZXJfZGF0YSA9ICh2
b2lkICopJmxjZDgwMHgxMjgwX3JpZ2h0c2lkZV91cCwKPj4gKyAgICAgICB9LCB7ICAgIC8qIExl
bm92byBJZGVhcGFkIEQzMzAgKEZIRCkgKi8KPj4gICAgICAgICAgICAgICAgIC5tYXRjaGVzID0g
ewo+PiAgICAgICAgICAgICAgICAgICBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJM
RU5PVk8iKSwKPj4gICAgICAgICAgICAgICAgICAgRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNU
X05BTUUsICI4MUgzIiksCj4+IC0tCj4+IDIuMjEuMAo+PgoKLS0gCkphbmkgTmlrdWxhLCBJbnRl
bCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
