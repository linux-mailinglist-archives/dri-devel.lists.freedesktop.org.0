Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7731C5591E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157DF6E229;
	Tue, 25 Jun 2019 20:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EE26E223
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:41:43 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8F1AE2002F;
 Tue, 25 Jun 2019 22:41:41 +0200 (CEST)
Date: Tue, 25 Jun 2019 22:41:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: drm/panel: simple: add sharp,
 lq070y3dg3b panel
Message-ID: <20190625204140.GE18595@ravnborg.org>
References: <cover.1559905870.git.hns@goldelico.com>
 <ee90ed56d2c294ce8ac3b44bf2229c5ab9f85e91.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee90ed56d2c294ce8ac3b44bf2229c5ab9f85e91.1559905870.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ztCEdXhiAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=TaQvIJAheEgyp50s76YA:9
 a=CjuIK1q_8ugA:10 a=nCm3ceeH17rKjHWsMeRo:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
 letux-kernel@openphoenux.org, David Airlie <airlied@linux.ie>,
 marek.belisko@gmail.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, tomi.valkeinen@ti.com,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDE6MTE6MTFQTSArMDIwMCwgSC4gTmlrb2xhdXMgU2No
YWxsZXIgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bn
b2xkZWxpY28uY29tPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
Pgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaGFycCxscTA3MHkzZGczYi50
eHQgICAgIHwgMTIgKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9zaGFycCxscTA3MHkzZGczYi50eHQKPiAKPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbHEw
NzB5M2RnM2IudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvc2hhcnAsbHEwNzB5M2RnM2IudHh0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjk1NTM0YjU1ZWU1Zgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaGFycCxscTA3MHkz
ZGczYi50eHQKPiBAQCAtMCwwICsxLDEyIEBACj4gK1NoYXJwIExRMDcwWTNERzNCIDcuMCIgV1ZH
QSBsYW5kc2NhcGUgVEZUIExDRCBwYW5lbAo+ICsKPiArUmVxdWlyZWQgcHJvcGVydGllczoKPiAr
LSBjb21wYXRpYmxlOiBzaG91bGQgYmUgInNoYXJwLGxxMDcweTNkZzNiIgo+ICsKPiArT3B0aW9u
YWwgcHJvcGVydGllczoKPiArLSBlbmFibGUtZ3Bpb3M6IEdQSU8gcGluIHRvIGVuYWJsZSBvciBk
aXNhYmxlIHRoZSBwYW5lbAo+ICstIGJhY2tsaWdodDogcGhhbmRsZSBvZiB0aGUgYmFja2xpZ2h0
IGRldmljZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwKPiArLSBwb3dlci1zdXBwbHk6IHBoYW5kbGUg
b2YgdGhlIHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVzIHRoZSBzdXBwbHkgdm9sdGFnZQo+ICsKPiAr
VGhpcyBiaW5kaW5nIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgc2ltcGxlLXBhbmVsIGJpbmRpbmcs
IHdoaWNoIGlzIHNwZWNpZmllZAo+ICtpbiBzaW1wbGUtcGFuZWwudHh0IGluIHRoaXMgZGlyZWN0
b3J5Lgo+IC0tIAo+IDIuMTkuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
