Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B757655947
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBC26E231;
	Tue, 25 Jun 2019 20:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E481E6E231
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:44:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4ADB720030;
 Tue, 25 Jun 2019 22:43:58 +0200 (CEST)
Date: Tue, 25 Jun 2019 22:43:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 0/5] drm/panel-simple: Add panel parameters for
 ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
Message-ID: <20190625204356.GF18595@ravnborg.org>
References: <cover.1559905870.git.hns@goldelico.com>
 <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=VwQbUJbxAAAA:8 a=F2Ilv35yRVFRMjSxL0sA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, David Airlie <airlied@linux.ie>,
 marek.belisko@gmail.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, tomi.valkeinen@ti.com,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmlrb2xhdXMKCj4gPiBWMzoKPiA+ICogYWRkIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gKHN1
Z2dlc3RlZCBieSBzYW1AcmF2bmJvcmcub3JnKQo+ID4gCj4gPiBWMiAyMDE5LTA2LTA1IDA3OjA3
OjA1Ogo+ID4gKiBmaXggdHlwbyBpbiA5OWR0YyBwYW5lbCBjb21wYXRpYmxlIHN0cmluZyAocmVw
b3J0ZWQgYnkgaW1pcmtpbkBhbHVtLm1pdC5lZHUpCj4gPiAKPiA+IFYxIDIwMTktMDYtMDQgMTQ6
NTM6MDA6Cj4gPiAKPiA+IFNpbmNlIHY1LjItcmMxIE9NQVAgaXMgbm8gbG9uZ2VyIHVzaW5nIGEg
c3BlY2lhbCBkaXNwbGF5IGRyaXZlciBhcmNoaXRlY3R1cmUKPiA+IGZvciBEUEkgcGFuZWxzLCBi
dXQgdXNlcyB0aGUgZ2VuZXJhbCBkcm0vcGFuZWwvcGFuZWwtc2ltcGxlLgo+ID4gCj4gPiBTbyB3
ZSBmaW5hbGx5IGNhbiBhZGQgU29DIGluZGVwZW5kZW50IHBhbmVsIGRlZmluaXRpb25zIGZvciB0
d28gcGFuZWwgbW9kZWxzCj4gPiB3aGljaCB3ZSBhbHJlYWR5IGhhZCB3b3JrZWQgb24gcXVpdGUg
YSB3aGlsZSBhZ28gKGJlZm9yZSBkZXZpY2UgdHJlZSB3YXMKPiA+IGludHJvZHVjZWQpOgo+ID4g
Cj4gPiAJaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8yODUxMjk1Lwo+ID4gCj4g
PiAKPiA+IAo+ID4gSC4gTmlrb2xhdXMgU2NoYWxsZXIgKDUpOgo+ID4gIGRybS9wYW5lbDogc2lt
cGxlOiBBZGQgU2hhcnAgTFEwNzBZM0RHM0IgcGFuZWwgc3VwcG9ydAo+ID4gIGRybS9wYW5lbDog
c2ltcGxlOiBBZGQgT3J0dXN0ZWNoIENPTTM3SDNNIHBhbmVsIHN1cHBvcnQKPiA+ICBkdC1iaW5k
aW5nczogZHJtL3BhbmVsOiBzaW1wbGU6IGFkZCBvcnR1c3RlY2gsY29tMzdoM20wNWR0YyBwYW5l
bAo+ID4gIGR0LWJpbmRpbmdzOiBkcm0vcGFuZWw6IHNpbXBsZTogYWRkIG9ydHVzdGVjaCxjb20z
N2gzbTk5ZHRjIHBhbmVsCj4gPiAgZHQtYmluZGluZ3M6IGRybS9wYW5lbDogc2ltcGxlOiBhZGQg
c2hhcnAsbHEwNzB5M2RnM2IgcGFuZWwKPiA+IAo+ID4gLi4uL2Rpc3BsYXkvcGFuZWwvb3J0dXN0
ZWNoLGNvbTM3aDNtMDVkdGMudHh0IHwgMTIgKysrKwo+ID4gLi4uL2Rpc3BsYXkvcGFuZWwvb3J0
dXN0ZWNoLGNvbTM3aDNtOTlkdGMudHh0IHwgMTIgKysrKwo+ID4gLi4uL2Rpc3BsYXkvcGFuZWwv
c2hhcnAsbHEwNzB5M2RnM2IudHh0ICAgICAgIHwgMTIgKysrKwo+ID4gZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXNpbXBsZS5jICAgICAgICAgIHwgNjMgKysrKysrKysrKysrKysrKysrKwo+
ID4gNCBmaWxlcyBjaGFuZ2VkLCA5OSBpbnNlcnRpb25zKCspCj4gPiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvb3J0dXN0
ZWNoLGNvbTM3aDNtMDVkdGMudHh0Cj4gPiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvb3J0dXN0ZWNoLGNvbTM3aDNtOTlk
dGMudHh0Cj4gPiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbHEwNzB5M2RnM2IudHh0Cj4gPiAKPiA+IC0tIAo+
ID4gMi4xOS4xCj4gPiAKPiAKPiBhbnkgcHJvZ3Jlc3MgdG93YXJkcyBtZXJnaW5nIHRoaXMgc29t
ZXdoZXJlPyBJdCBkaWQgbm90IHlldCBhcnJpdmUgaW4gbGludXgtbmV4dC4KPiAKPiBCVFc6IHNo
b3VsZCBhbHNvIGJlIGFwcGxpZWQgdG8gNS4yClRoZSBkcm0gYml0cyBhcmUgcmV2aWV3ZWQuIFRo
ZSBEVCBiaXRzIG5lZWRzIE9LIGZyb20gRFQgcGVvcGxlLgpXaGVuIHdlIGhhdmUgT0sgZnJvbSBE
VCBwZW9wbGUgd2UgY2FuIGFwcGx5IHRoZW0gYWxsIHRvIGRybS1taXNjLW5leHQuCgpJZiB3ZSBu
ZWVkIHRoZW0gZXhwZWRpdGVkIHRvd2FyZHMgdGhlIHVwc3RyZWFtIGtlcm5lbCB5b3Ugd2lsbCBu
ZWVkIGhlbHAKZnJvbSBzb21lb25lIGVsc2UuIEJ1dCBsZXQncyBnZXQgdGhlbSBpbiBkcm0tbWlz
Yy1uZXh0IGZpcnN0LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
