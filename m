Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3E8113D49
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 09:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C318489286;
	Thu,  5 Dec 2019 08:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881E86F5F3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 08:46:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9DC02E5;
 Thu,  5 Dec 2019 09:46:33 +0100 (CET)
Date: Thu, 5 Dec 2019 10:46:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: Add obsolete note to
 "ti,tilcdc,panel" binding
Message-ID: <20191205084626.GB4734@pendragon.ideasonboard.com>
References: <cover.1575481630.git.jsarha@ti.com>
 <eabe78184ea7125dcff50826a0ee12a892443017.1575481630.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eabe78184ea7125dcff50826a0ee12a892443017.1575481630.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575535594;
 bh=8TJsjX9IMvcIxIR6rtYMP5rvFtEm/ezfomI72rg3LWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J2J6kqttuSr10yCnUUiJ3/FHYvpSYKemAAigqbL9IXHSbbzwjC4j7BYgmgNXYvgYO
 hYBQOyku/R/oy/apxEZ0MgarfBtNn0TbupW6wVrNljclC4t0P7cMUpi5el+BiltIPw
 sh6s5PEoxgUTdR8Jpe7QUdDdEu+QzOMiFuyWA/0o=
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
Cc: devicetree@vger.kernel.org, tony@atomide.com, tomi.valkeinen@ti.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, robh+dt@kernel.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSnlyaSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gV2VkLCBEZWMgMDQsIDIwMTkg
YXQgMDc6NTM6MTFQTSArMDIwMCwgSnlyaSBTYXJoYSB3cm90ZToKPiBUaGUgInRpLHRpbGNkYyxw
YW5lbCIgYmluZGluZyBzaG91bGQgbm90IGJlIHVzZWQgYW55bW9yZSwgc2luY2UgdGlsY2RjCj4g
aXMgZnVsbHkgY2FwYWJsZSBvZiB1c2luZyBnZW5lcmljIGRybSBwYW5lbHMgbGlrZSBwYW5lbC1z
aW1wbGUgYW5kCj4gcGFuZWwtY29tbW9uIGJpbmRpbmcuIEhvd2V2ZXIsIHRoZSBvYnNvbGV0ZSBi
aW5kaW5nIGlzIHN0aWxsIHdpZGVseQo+IHVzZWQgaW4gbWFueSBtYWlubGluZSBzdXBwb3J0ZWQg
cGxhdGZvcm1zIHRoYXQgSSBkbyBub3QgaGF2ZSBhY2Nlc3MgdG8KPiBhbmQgd2hvIGtub3dzIGhv
dyBtYW55IGN1c3RvbSBwbGF0Zm9ybXMuIFNvIEkgYW0gYWZyYWlkIHdlIGhhdmUgdG8KPiBrZWVw
IHRoZSBvbGQgYnVuZGxlZCB0aWxjZGMgcGFuZWwgZHJpdmVyIGFyb3VuZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS90aWxjZGMvcGFuZWwudHh0IHwgNiArKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS90aWxjZGMvcGFuZWwudHh0IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGlsY2RjL3BhbmVsLnR4
dAo+IGluZGV4IDgwODIxNjMxMGVhMi4uNTQ5NjNmOTE3M2NjIDEwMDY0NAo+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3RpbGNkYy9wYW5lbC50eHQKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS90aWxjZGMvcGFu
ZWwudHh0Cj4gQEAgLTEsNSArMSwxMSBAQAo+ICBEZXZpY2UtVHJlZSBiaW5kaW5ncyBmb3IgdGls
Y2RjIERSTSBnZW5lcmljIHBhbmVsIG91dHB1dCBkcml2ZXIKPiAgCj4gK05PVEU6IFRoaXMgYmlu
ZGluZyAoYW5kIHRoZSByZWxhdGVkIGRyaXZlcikgaXMgb2Jzb2xldGUgYW5kIHNob3VsZCBub3QK
PiArICAgICAgYmUgdXNlZCBhbnltb3JlLiBQbGVhc2UgcmVmZXIgdG8gZHJtIHBhbmVsLWNvbW1v
biBiaW5kaW5nIChhbmQKPiArICAgICAgdG8gYSBnZW5lcmljIGRybSBwYW5lbCBkcml2ZXIgbGlr
ZSBwYW5lbC1zaW1wbGUpLgo+ICsgICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9wYW5lbC1jb21tb24ueWFtbAo+ICsgICAgICAoZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jKQo+ICsKCkhvdyBhYm91dCBhZGRpbmcgYSBXQVJOX09O
KCkgaW4gdGhlIGNvZGUgd2hlbiB0aGlzIGJpbmRpbmcgaXMgdXNlZCA/ClRoaXMgY291bGQgaGVs
cCBnZXR0aW5nIHRob3NlIHBsYXRmb3JtcyBjb252ZXJ0ZWQuCgo+ICBSZXF1aXJlZCBwcm9wZXJ0
aWVzOgo+ICAgLSBjb21wYXRpYmxlOiB2YWx1ZSBzaG91bGQgYmUgInRpLHRpbGNkYyxwYW5lbCIu
Cj4gICAtIHBhbmVsLWluZm86IGNvbmZpZ3VyYXRpb24gaW5mbyB0byBjb25maWd1cmUgTENEQyBj
b3JyZWN0bHkgZm9yIHRoZSBwYW5lbAoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
