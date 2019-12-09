Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0FF1169EC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F096E34D;
	Mon,  9 Dec 2019 09:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00336E330
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 08:51:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id E568628FFE3
Subject: Re: [resend PATCH v6 02/12] dt-bindings: mediatek: Add compatible for
 mt7623
To: matthias.bgg@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie,
 mturquette@baylibre.com, sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-3-matthias.bgg@kernel.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <d09c3801-71cf-4855-8370-95d146b76ed4@collabora.com>
Date: Mon, 9 Dec 2019 09:51:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191207224740.24536-3-matthias.bgg@kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
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
Cc: devicetree@vger.kernel.org, rdunlap@infradead.org, frank-w@public-files.de,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean.wang@kernel.org, wens@csie.org,
 drinkcat@chromium.org, linux-mediatek@lists.infradead.org, mbrugger@suse.com,
 hsinyi@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF0dGhpYXMsCgpPbiA3LzEyLzE5IDIzOjQ3LCBtYXR0aGlhcy5iZ2dAa2VybmVsLm9yZyB3
cm90ZToKPiBGcm9tOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4KPiAKPiBN
ZWRpYVRlayBtdDc2MjMgdXNlcyB0aGUgbXQyNzAxIGJpbmluZ3MgYXMgZmFsbGJhY2suCgp0eXBv
IHMvYmluaW5ncy9iaW5kaW5ncy8KCj4gRG9jdW1lbnQgdGhpcyBpbiB0aGUgYmluZGluZyBkZXNj
cmlwdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBz
dXNlLmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkaXNwLnR4dCAgICAgIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiBp
bmRleCBjNzFjOGE0YjczZmYuLmE3NDc4OTU1NzRmMSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4
dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gQEAgLTQyLDYgKzQyLDggQEAgUmVxdWlyZWQgcHJvcGVy
dGllcyAoYWxsIGZ1bmN0aW9uIGJsb2Nrcyk6Cj4gIAkibWVkaWF0ZWssPGNoaXA+LWRpc3Atb2Qi
CQktIG92ZXJkcml2ZQo+ICAJIm1lZGlhdGVrLDxjaGlwPi1tbXN5cyIsICJzeXNjb24iCS0gcHJv
dmlkZSBjbG9ja3MgYW5kIGNvbXBvbmVudHMgbWFuYWdlbWVudAo+ICAgIHRoZSBzdXBwb3J0ZWQg
Y2hpcHMgYXJlIG10MjcwMSwgbXQyNzEyIGFuZCBtdDgxNzMuCj4gKyAgRm9yIG10NzYyMywgY29t
cGF0aWJsZSBtdXN0IGJlOgo+ICsgICAgICAgICJtZWRpYXRlayxtdDc2MjMtPGNvbXBvbmVudD4i
ICwgIm1lZGlhdGVrLG10MjcwMS08Y29tcG9uZW50PiIKPiAgCj4gIC0gcmVnOiBQaHlzaWNhbCBi
YXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgZnVuY3Rpb24gYmxvY2sgcmVnaXN0ZXIgc3Bh
Y2UKPiAgLSBpbnRlcnJ1cHRzOiBUaGUgaW50ZXJydXB0IHNpZ25hbCBmcm9tIHRoZSBmdW5jdGlv
biBibG9jayAocmVxdWlyZWQsIGV4Y2VwdCBmb3IKPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
