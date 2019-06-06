Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DA637A8C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 19:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EB8893D0;
	Thu,  6 Jun 2019 17:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6E3893D0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 17:08:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59FB433B;
 Thu,  6 Jun 2019 19:08:16 +0200 (CEST)
Date: Thu, 6 Jun 2019 20:08:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 13/20] arm64: dts: renesas: r8a77995: Add CMM units
Message-ID: <20190606170802.GB27525@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-14-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-14-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559840896;
 bh=MnSu6i10WmQXXK8idR8J8iA4SFx8Pgt+jsvqJyMXAi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ksMQxRdtqDkHjOhLIOnPxyEkxrJr/sKU27HPkDcLlX2ZfidqchsMLajbp02xhJL97
 LlvsaRG27UsXRJK2hMcpLn3JO9axz+C3PAnuHEnmxx/NIY/geHntMgVMQW64zomN3W
 qxJzvxt+MCn/zISOJ5y0FWXk8nxSow73jU+0ANZ4=
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
OSBhdCAwNDoyMjoxM1BNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIENNTSB1bml0
cyB0byBSZW5lc2FzIFItQ2FyIEQzIGRldmljZSB0cmVlIGFuZCByZWZlcmVuY2UgdGhlbSBmcm9t
Cj4gdGhlIERpc3BsYXkgVW5pdCB0aGV5IGFyZSBjb25uZWN0ZWQgdG8uCj4gCj4gV2hpbGUgYXQg
aXQsIHJlLXNvcnQgdGhlIGR1IGRldmljZSBub2RlIHByb3BlcnRpZXMgdG8gbWF0Y2ggdGhlIG9y
ZGVyaW5nCj4gZm91bmQgaW4gb3RoZXIgU29Dcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8g
TW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKPiAtLS0KPiAgYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTk1LmR0c2kgfCAyMCArKysrKysrKysrKysr
KysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUu
ZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5NS5kdHNpCj4gaW5kZXgg
NWJmM2FmMjQ2ZTE0Li5jNTJkNzMwNjgzMDQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3I4YTc3OTk1LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc5OTUuZHRzaQo+IEBAIC05OTMsNiArOTkzLDIyIEBACj4gIAkJCWlvbW11cyA9
IDwmaXBtbXVfdmkwIDk+Owo+ICAJCX07Cj4gIAo+ICsJCWNtbTA6IGNtbUBmZWE0MDAwMCB7Cj4g
KwkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxjbW0tZ2VuMyI7Cj4gKwkJCXJlZyA9IDwwIDB4ZmVh
NDAwMDAgMCAweDEwMDA+Owo+ICsJCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcxMT47Cj4gKwkJ
CXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5OTVfUERfQUxXQVlTX09OPjsKPiArCQkJcmVz
ZXRzID0gPCZjcGcgNzExPjsKPiArCQl9Owo+ICsKPiArCQljbW0xOiBjbW1AZmVhNTAwMDAgewo+
ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLWdlbjMiOwo+ICsJCQlyZWcgPSA8MCAweGZl
YTUwMDAwIDAgMHgxMDAwPjsKPiArCQkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MTA+Owo+ICsJ
CQlwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OTk1X1BEX0FMV0FZU19PTj47Cj4gKwkJCXJl
c2V0cyA9IDwmY3BnIDcxMD47Cj4gKwkJfTsKPiArCj4gIAkJZHU6IGRpc3BsYXlAZmViMDAwMDAg
ewo+ICAJCQljb21wYXRpYmxlID0gInJlbmVzYXMsZHUtcjhhNzc5OTUiOwo+ICAJCQlyZWcgPSA8
MCAweGZlYjAwMDAwIDAgMHg4MDAwMD47Cj4gQEAgLTEwMDEsOSArMTAxNywxMSBAQAo+ICAJCQlj
bG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcyND4sCj4gIAkJCQkgPCZjcGcgQ1BHX01PRCA3MjM+Owo+
ICAJCQljbG9jay1uYW1lcyA9ICJkdS4wIiwgImR1LjEiOwo+IC0JCQl2c3BzID0gPCZ2c3BkMCAw
ICZ2c3BkMSAwPjsKPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgCj4gKwkJCXZzcHMgPSA8
JnZzcGQwIDAgJnZzcGQxIDA+Owo+ICsJCQljbW1zID0gPCZjbW0wICZjbW0xPjsKPiArCj4gIAkJ
CXBvcnRzIHsKPiAgCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAJCQkJI3NpemUtY2VsbHMg
PSA8MD47CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
