Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600BA37A7B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 19:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0052888ECC;
	Thu,  6 Jun 2019 17:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FD088C4C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 17:05:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EEB0333B;
 Thu,  6 Jun 2019 19:05:13 +0200 (CEST)
Date: Thu, 6 Jun 2019 20:04:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 09/20] arm64: dts: renesas: r8a7796: Add CMM units
Message-ID: <20190606170459.GP12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-10-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-10-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559840714;
 bh=CVBp/IEh5vhwWYspt56rtYg6AI6x08afKyjXhCh6rY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sfE6alK/3GMjn1/8cjiAuGj3QPlcibWcDobcOFwCRqgDelqvyoohMySGecYgxNmQO
 iPhTHx7tQnCZO0Q4sj6Q0NL+SIMTlKQgVK9aWG9Kb090OdUuhFSHCq2Ch6Qj4DVcJz
 c3rxvD59HbczAdda50K4chnkVolcIU/dFnj2hDhQ=
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBUaHUsIEp1biAwNiwgMjAx
OSBhdCAwNDoyMjowOVBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIENNTSB1bml0
cyB0byBSZW5lc2FzIFItQ2FyIE0zLVcgZGV2aWNlIHRyZWUgYW5kIHJlZmVyZW5jZSB0aGVtIGZy
b20KPiB0aGUgRGlzcGxheSBVbml0IHRoZXkgYXJlIGNvbm5lY3RlZCB0by4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+CgpSZXZpZXdl
ZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
PgoKPiAtLS0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTYuZHRzaSB8IDI1
ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5
Ni5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTYuZHRzaQo+IGluZGV4
IGNkZjc4NDg5OWNmOC4uMmUxODkxZDlkMzIyIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOGE3Nzk2LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc5Ni5kdHNpCj4gQEAgLTI2MTAsNiArMjYxMCwzMCBAQAo+ICAJCQlyZW5lc2Fz
LGZjcCA9IDwmZmNwdmkwPjsKPiAgCQl9Owo+ICAKPiArCQljbW0wOiBjbW1AZmVhNDAwMDAgewo+
ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLWdlbjMiOwo+ICsJCQlyZWcgPSA8MCAweGZl
YTQwMDAwIDAgMHgxMDAwPjsKPiArCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MTE+Owo+ICsJ
CQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTZfUERfQUxXQVlTX09OPjsKPiArCQkJcmVz
ZXRzID0gPCZjcGcgNzExPjsKPiArCQl9Owo+ICsKPiArCQljbW0xOiBjbW1AZmVhNTAwMDAgewo+
ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLWdlbjMiOwo+ICsJCQlyZWcgPSA8MCAweGZl
YTUwMDAwIDAgMHgxMDAwPjsKPiArCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MTA+Owo+ICsJ
CQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTZfUERfQUxXQVlTX09OPjsKPiArCQkJcmVz
ZXRzID0gPCZjcGcgNzEwPjsKPiArCQl9Owo+ICsKPiArCQljbW0yOiBjbW1AZmVhNjAwMDAgewo+
ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLWdlbjMiOwo+ICsJCQlyZWcgPSA8MCAweGZl
YTYwMDAwIDAgMHgxMDAwPjsKPiArCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MDk+Owo+ICsJ
CQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTZfUERfQUxXQVlTX09OPjsKPiArCQkJcmVz
ZXRzID0gPCZjcGcgNzA5PjsKPiArCQl9Owo+ICsKPiAgCQljc2kyMDogY3NpMkBmZWE4MDAwMCB7
Cj4gIAkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3Nzk2LWNzaTIiOwo+ICAJCQlyZWcgPSA8
MCAweGZlYTgwMDAwIDAgMHgxMDAwMD47Cj4gQEAgLTI3NjMsNiArMjc4Nyw3IEBACj4gIAkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7Cj4gIAo+ICAJCQl2c3BzID0gPCZ2c3BkMCAmdnNwZDEgJnZzcGQy
PjsKPiArCQkJY21tcyA9IDwmY21tMCAmY21tMSAmY21tMj47Cj4gIAo+ICAJCQlwb3J0cyB7Cj4g
IAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFy
dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
