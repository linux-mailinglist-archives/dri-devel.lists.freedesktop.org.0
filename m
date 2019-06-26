Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B4E569C8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 14:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524836E417;
	Wed, 26 Jun 2019 12:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE83B6E417
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 12:55:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CBC4020042;
 Wed, 26 Jun 2019 14:55:08 +0200 (CEST)
Date: Wed, 26 Jun 2019 14:55:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jerry Han <jerry.han.hq@gmail.com>
Subject: Re: [PATCH] [v8, 1/2] dt-bindings: panel: Add Boe Himax8279d is
 1200x1920, 4-lane MIPI-DSI LCD panel
Message-ID: <20190626125507.GC23428@ravnborg.org>
References: <20190425031842.17202-1-jerry.han.hq@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190425031842.17202-1-jerry.han.hq@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=7gkXJVJtAAAA:8 a=cm27Pg_UAAAA:8 a=mpaa-ttXAAAA:8 a=pyRKsyEBAAAA:8
 a=O_Z5Qjc-ycNOmbOR8aYA:9 a=mhh5wNOqWCzj-_IG:21 a=fe8l_t4Q3oV-Si5G:21
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=xmb-EsYY8bH0VWELuYED:22
 a=6heAxKwa5pAsJatQ0mat:22 a=jmCdmrpiGMLo1jCbbjXX:22
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Rock wang <rock_wang@himax.com.cn>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMTE6MTg6NDJBTSArMDgwMCwgSmVycnkgSGFuIHdyb3Rl
Ogo+IFRoZSBCb2UgSGltYXg4Mjc5ZCBpcyBhIDguMCIgcGFuZWwgd2l0aCBhIDEyMDB4MTkyMCBy
ZXNvbHV0aW9uIGFuZAo+IGNvbm5lY3RlZCB0byBEU0kgdXNpbmcgZm91ciBsYW5lcy4KPiAKPiBW
ODoKPiAtIE1vZGlmeSBjb21tdW5pY2F0aW9uIGFkZHJlc3MKPiAKPiBWNzoKPiAtIEFkZCB0aGUg
aW5mb3JtYXRpb24gb2YgdGhlIHJldmlld2VyCj4gCj4gVjY6Cj4gLSBBZGQgdGhlIGluZm9ybWF0
aW9uIG9mIHRoZSByZXZpZXdlcgo+IAo+IFY1Ogo+IC0gQWRkZWQgY2hhbmdlbG9nCj4gCj4gVjQ6
Cj4gLSBOb25lCj4gCj4gVjM6Cj4gLSBOb25lCj4gCj4gVjI6Cj4gLSBBZGQgY29tcGF0aWJsZSBk
ZXZpY2UgImJvZSxoaW1heDgyNzlkMTBwIiAoU2FtKQo+IC0gQWRkIHRoZSBuZWNlc3NhcnkgcHJv
cGVydHkgZGVzY3JpcHRpb25zIChTYW0pCj4gCj4gU2lnbmVkLW9mZi1ieTogSmVycnkgSGFuIDxq
ZXJyeS5oYW4uaHFAZ21haWwuY29tPgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+Cj4gUmV2aWV3ZWQtYnk6IERlcmVrIEJhc2Vob3JlIDxkYmFzZWhvcmVAY2hy
b21pdW0ub3JnPgo+IENjOiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gQ2M6
IFJvY2sgd2FuZyA8cm9ja193YW5nQGhpbWF4LmNvbS5jbj4KClRoYW5rcywKcGF0Y2ggYXBwbGll
ZCB0byBkcm0tbWlzYy1uZXh0IGFuZCB3aWxsIGJlIHB1c2hlZCBvdXQgc29vbi4KCglTYW0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
