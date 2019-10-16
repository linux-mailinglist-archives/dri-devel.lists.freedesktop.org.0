Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7EED941E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 16:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4BF6E0A8;
	Wed, 16 Oct 2019 14:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370C76E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 14:40:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34F3C9F4;
 Wed, 16 Oct 2019 16:40:21 +0200 (CEST)
Date: Wed, 16 Oct 2019 17:40:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH V5 2/3] dt-bindings: Add Logic PD Type 28 display panel
Message-ID: <20191016144018.GG5175@pendragon.ideasonboard.com>
References: <20191016135147.7743-1-aford173@gmail.com>
 <20191016135147.7743-2-aford173@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016135147.7743-2-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1571236821;
 bh=Ix3XoJ8c2YHEbbRw/h23s9VQOlN2/0+X/ZG7Iozx4OM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t2WIQRuEIMiyqAfhI9K8seGMZLbuogVv7sRdQ7WqmidxqES1u0zjmgqsIAcvtNU0X
 7hOxXRHo7DR3i+oByIuV5RL8j6//k0NHBiGcO2C9kzqa9jMY4EOZznm/CB7A/E20Et
 OKbsxfLMRm3Payf72G5DnLmaBjHgn8ddDYDVKxHs=
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
 David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRhbSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gV2VkLCBPY3QgMTYsIDIwMTkg
YXQgMDg6NTE6NDZBTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBk
b2N1bWVudGF0aW9uIG9mIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgV1ZHQSBwYW5lbAo+
IExvZ2ljIFBEIFR5cGUgMjggZGlzcGxheS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQg
PGFmb3JkMTczQGdtYWlsLmNvbT4KPiAtLS0KPiBWNTogIFJlcGxhY2UgR1BJT19BQ1RJVkVfSElH
SCB3aXRoIDAgdG8gZml4IG1ha2UgZHRfYmluZGluZ19jaGVjayAtawo+IFY0OiAgVXBkYXRlIHBl
ciBSb2IgSCdzIHN1Z2dlc3Rpb25zIGFuZCBjb3B5IG90aGVyIHBhbmVsIHlhbWwgZXhhbXBsZSBm
cm9tIDUuNC1yYzEKPiBWMzogIENvcnJlY3QgYnVpbGQgZXJyb3JzIGZyb20gJ21ha2UgZHRfYmlu
ZGluZ19jaGVjaycKPiBWMjogIFVzZSBZQU1MIGluc3RlYWQgb2YgVFhUIGZvciBiaW5kaW5nCj4g
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL2xvZ2ljcGQsdHlwZTI4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9sb2dpY3BkLHR5cGUyOC55YW1sCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjI4MzQyODdiOGQ4OAo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9s
b2dpY3BkLHR5cGUyOC55YW1sCj4gQEAgLTAsMCArMSw0MiBAQAo+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL2xvZ2ljcGQsdHlwZTI4LnlhbWwjCj4g
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+
ICsKPiArdGl0bGU6IExvZ2ljIFBEIFR5cGUgMjggNC4zIiBXUVZHQSBURlQgTENEIHBhbmVsCj4g
Kwo+ICttYWludGFpbmVyczoKPiArICAtIEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPgo+
ICsKPiArYWxsT2Y6Cj4gKyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKPiArCj4gK3Byb3Bl
cnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIGNvbnN0OiBsb2dpY3BkLHR5cGUyOAo+ICsK
PiArICBwb3dlci1zdXBwbHk6IHRydWUKPiArICBlbmFibGUtZ3Bpb3M6IHRydWUKPiArICBiYWNr
bGlnaHQ6IHRydWUKPiArICBwb3J0OiB0cnVlCj4gKwo+ICtyZXF1aXJlZDoKPiArICAtIGNvbXBh
dGlibGUKClNob3VsZCB0aGUgcG9ydCBiZSByZXF1aXJlZCB0b28gPyBBcGFydCBmcm9tIHRoYXQs
CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgoKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArZXhh
bXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICBsY2QwOiBkaXNwbGF5IHsKPiArICAgICAgY29tcGF0aWJs
ZSA9ICJsb2dpY3BkLHR5cGUyOCI7Cj4gKyAgICAgIGVuYWJsZS1ncGlvcyA9IDwmZ3BpbzUgMjcg
MD47Cj4gKyAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKPiArICAgICAgcG9ydCB7Cj4g
KyAgICAgICAgbGNkX2luOiBlbmRwb2ludCB7Cj4gKyAgICAgICAgICByZW1vdGUtZW5kcG9pbnQg
PSA8JmRwaV9vdXQ+Owo+ICsgICAgICAgIH07Cj4gKyAgICAgIH07Cj4gKyAgICB9Owo+ICsKPiAr
Li4uCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
