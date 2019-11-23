Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CAB107F00
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 16:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAAD6E0AD;
	Sat, 23 Nov 2019 15:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA546E0AD
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2019 15:27:44 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E99EB2008A;
 Sat, 23 Nov 2019 16:27:39 +0100 (CET)
Date: Sat, 23 Nov 2019 16:27:38 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Frida LCD
 Co., Ltd.
Message-ID: <20191123152738.GA27045@ravnborg.org>
References: <20191120171027.1102250-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120171027.1102250-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=7gkXJVJtAAAA:8 a=qIjRjsPfdrvINvMtCKIA:9 a=CjuIK1q_8ugA:10
 a=9LHmKk7ezEChjTCyhBa9:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bC4KCk9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDA2OjEwOjI1UE0gKzAxMDAsIFBhdWwg
Q2VyY3VlaWwgd3JvdGU6Cj4gQWRkIGFuIGVudHJ5IGZvciBTaGVuemhlbiBGcmlkYSBMQ0QgQ28u
LCBMdGQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxv
dS5uZXQ+CgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IC0t
LQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlh
bWwgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55
YW1sCj4gaW5kZXggOTY3ZTc4YzVlYzBhLi45YzZlMWI0MjQzNWIgMTAwNjQ0Cj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1s
Cj4gQEAgLTMzNyw2ICszMzcsOCBAQCBwYXR0ZXJuUHJvcGVydGllczoKPiAgICAgIGRlc2NyaXB0
aW9uOiBGaXJlZmx5Cj4gICAgIl5mb2NhbHRlY2gsLioiOgo+ICAgICAgZGVzY3JpcHRpb246IEZv
Y2FsVGVjaCBTeXN0ZW1zIENvLixMdGQKPiArICAiXmZyaWRhLC4qIjoKPiArICAgIGRlc2NyaXB0
aW9uOiBTaGVuemhlbiBGcmlkYSBMQ0QgQ28uLCBMdGQuClJhbmRvbSBub3RlOgpTb21lIGRlc2Ny
aXB0aW9ucyBlbmQgd2l0aCBhICcuLCcsIG90aGVycyBub3QuClNvIGJvdGggd29ya3MuCgoKPiAg
ICAiXmZyaWVuZGx5YXJtLC4qIjoKPiAgICAgIGRlc2NyaXB0aW9uOiBHdWFuZ3pob3UgRnJpZW5k
bHlBUk0gQ29tcHV0ZXIgVGVjaCBDby4sIEx0ZAo+ICAgICJeZnNsLC4qIjoKPiAtLSAKPiAyLjI0
LjAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
