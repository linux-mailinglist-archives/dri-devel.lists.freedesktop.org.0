Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208089D96C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA196E326;
	Mon, 26 Aug 2019 22:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD086E326
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:46:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47C1D9A4;
 Tue, 27 Aug 2019 00:46:03 +0200 (CEST)
Date: Tue, 27 Aug 2019 01:45:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 05/14] arm64: dts: renesas: r8a77965: Add CMM units
Message-ID: <20190826224557.GN5031@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825135154.11488-6-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566859563;
 bh=SWj3spkwkOtYX8YrJap0S99T5V3UGXz7NDMFec8t+/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GRXcRZTVF+SUiyl1YUHYf6U9ibc5kaCtFoPU7a/QbSW6QY7pEMHCEwyoStK6MnRRo
 xxxo6C22MJz73z2csXObfDkGBpMbfTYMP11ezzxtxIVQ6zDI2MKJyEmz5lK/M3YYBN
 41pZj8UkpvnYuVWXqu2hnuK5f+QF7ce+GVZupa/Y=
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
Cc: muroya@ksk.co.jp, uli@fpond.eu, horms@verge.net.au,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTdW4sIEF1ZyAyNSwgMjAx
OSBhdCAwMzo1MTo0NVBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIENNTSB1bml0
cyB0byBSZW5lc2FzIFItQ2FyIE0zLU4gZGV2aWNlIHRyZWUgYW5kIHJlZmVyZW5jZSB0aGVtIGZy
b20KPiB0aGUgRGlzcGxheSBVbml0IHRoZXkgYXJlIGNvbm5lY3RlZCB0by4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+CgpBcGFydCBm
cm9tIHRoZSBpc3N1ZSB3aXRoIGNvbXBhdGlibGUgc3RyaW5nIGFzIHBvaW50ZWQgb3V0IGZvciBw
YXRjaAowMy8xNCwKClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+Cgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjhhNzc5NjUuZHRzaSB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOGE3Nzk2NS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3I4YTc3OTY1LmR0c2kKPiBpbmRleCA0YWUxNjMyMjBmNjAuLjhjZjBkMDQ5MjAzZCAxMDA2NDQK
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUuZHRzaQo+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2NS5kdHNpCj4gQEAgLTIzMjAsNiAr
MjMyMCwzMCBAQAo+ICAJCQlyZXNldHMgPSA8JmNwZyA2MTE+Owo+ICAJCX07Cj4gIAo+ICsJCWNt
bTA6IGNtbUBmZWE0MDAwMCB7Cj4gKwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxjbW0tcjhhNzc5
NjUiOwo+ICsJCQlyZWcgPSA8MCAweGZlYTQwMDAwIDAgMHgxMDAwPjsKPiArCQkJY2xvY2tzID0g
PCZjcGcgQ1BHX01PRCA3MTE+Owo+ICsJCQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTY1
X1BEX0FMV0FZU19PTj47Cj4gKwkJCXJlc2V0cyA9IDwmY3BnIDcxMT47Cj4gKwkJfTsKPiArCj4g
KwkJY21tMTogY21tQGZlYTUwMDAwIHsKPiArCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNtbS1y
OGE3Nzk2NSI7Cj4gKwkJCXJlZyA9IDwwIDB4ZmVhNTAwMDAgMCAweDEwMDA+Owo+ICsJCQljbG9j
a3MgPSA8JmNwZyBDUEdfTU9EIDcxMD47Cj4gKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhB
Nzc5NjVfUERfQUxXQVlTX09OPjsKPiArCQkJcmVzZXRzID0gPCZjcGcgNzEwPjsKPiArCQl9Owo+
ICsKPiArCQljbW0zOiBjbW1AZmVhNzAwMDAgewo+ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMs
Y21tLXI4YTc3OTY1IjsKPiArCQkJcmVnID0gPDAgMHhmZWE3MDAwMCAwIDB4MTAwMD47Cj4gKwkJ
CWNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzA4PjsKPiArCQkJcG93ZXItZG9tYWlucyA9IDwmc3lz
YyBSOEE3Nzk2NV9QRF9BTFdBWVNfT04+Owo+ICsJCQlyZXNldHMgPSA8JmNwZyA3MDg+Owo+ICsJ
CX07Cj4gKwo+ICAJCWNzaTIwOiBjc2kyQGZlYTgwMDAwIHsKPiAgCQkJY29tcGF0aWJsZSA9ICJy
ZW5lc2FzLHI4YTc3OTY1LWNzaTIiOwo+ICAJCQlyZWcgPSA8MCAweGZlYTgwMDAwIDAgMHgxMDAw
MD47Cj4gQEAgLTI0NzAsNiArMjQ5NCw3IEBACj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4g
IAo+ICAJCQl2c3BzID0gPCZ2c3BkMCAwPiwgPCZ2c3BkMSAwPiwgPCZ2c3BkMCAxPjsKPiArCQkJ
Y21tcyA9IDwmY21tMCAmY21tMSAmY21tMz47Cj4gIAo+ICAJCQlwb3J0cyB7Cj4gIAkJCQkjYWRk
cmVzcy1jZWxscyA9IDwxPjsKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
