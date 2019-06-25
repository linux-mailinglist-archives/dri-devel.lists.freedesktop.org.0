Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EA755914
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BCA6E226;
	Tue, 25 Jun 2019 20:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323CC6E223
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:40:40 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 32B4C2002F;
 Tue, 25 Jun 2019 22:40:38 +0200 (CEST)
Date: Tue, 25 Jun 2019 22:40:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: drm/panel: simple: add ortustech,
 com37h3m99dtc panel
Message-ID: <20190625204036.GD18595@ravnborg.org>
References: <cover.1559905870.git.hns@goldelico.com>
 <3e0720fbddfd7b35ad8551440544411485d8ad9f.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e0720fbddfd7b35ad8551440544411485d8ad9f.1559905870.git.hns@goldelico.com>
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

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDE6MTE6MTBQTSArMDIwMCwgSC4gTmlrb2xhdXMgU2No
YWxsZXIgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bn
b2xkZWxpY28uY29tPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
Pgo+IC0tLQo+ICAuLi4vZGlzcGxheS9wYW5lbC9vcnR1c3RlY2gsY29tMzdoM205OWR0Yy50eHQg
ICAgICAgIHwgMTIgKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9vcnR1c3RlY2gsY29tMzdoM205OWR0Yy50eHQKPiAKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvb3J0
dXN0ZWNoLGNvbTM3aDNtOTlkdGMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvb3J0dXN0ZWNoLGNvbTM3aDNtOTlkdGMudHh0Cj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjA2YTczYzNmNDZiNQo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9vcnR1c3RlY2gsY29tMzdoM205OWR0Yy50eHQKPiBAQCAtMCwwICsxLDEyIEBACj4gK09y
dHVzVGVjaCBDT00zN0gzTTk5RFRDIEJsYW52aWV3IDMuNyIgVkdBIHBvcnRyYWl0IFRGVC1MQ0Qg
cGFuZWwKPiArCj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gKy0gY29tcGF0aWJsZTogc2hvdWxk
IGJlICJvcnR1c3RlY2gsY29tMzdoM205OWR0YyIKPiArCj4gK09wdGlvbmFsIHByb3BlcnRpZXM6
Cj4gKy0gZW5hYmxlLWdwaW9zOiBHUElPIHBpbiB0byBlbmFibGUgb3IgZGlzYWJsZSB0aGUgcGFu
ZWwKPiArLSBiYWNrbGlnaHQ6IHBoYW5kbGUgb2YgdGhlIGJhY2tsaWdodCBkZXZpY2UgYXR0YWNo
ZWQgdG8gdGhlIHBhbmVsCj4gKy0gcG93ZXItc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0
b3IgdGhhdCBwcm92aWRlcyB0aGUgc3VwcGx5IHZvbHRhZ2UKPiArCj4gK1RoaXMgYmluZGluZyBp
cyBjb21wYXRpYmxlIHdpdGggdGhlIHNpbXBsZS1wYW5lbCBiaW5kaW5nLCB3aGljaCBpcyBzcGVj
aWZpZWQKPiAraW4gc2ltcGxlLXBhbmVsLnR4dCBpbiB0aGlzIGRpcmVjdG9yeS4KPiAtLSAKPiAy
LjE5LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
