Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52282116F88
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDD96E486;
	Mon,  9 Dec 2019 14:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B6E6E486
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:50:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CD25DAD;
 Mon,  9 Dec 2019 15:50:31 +0100 (CET)
Date: Mon, 9 Dec 2019 16:50:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: Add obsolete note to
 "ti,tilcdc,panel" binding
Message-ID: <20191209145024.GB12841@pendragon.ideasonboard.com>
References: <cover.1575901747.git.jsarha@ti.com>
 <459ed943fe0725200062171755bcfe5f73713d50.1575901747.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <459ed943fe0725200062171755bcfe5f73713d50.1575901747.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575903031;
 bh=iMA0EMCIcVhf1bAexv25ojEbqExgp+n80z/z9CDFqJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kehsnBfjJjSGCd9e2JiRW6Qz+YP1pdWYqrl+G1It+mEU+1vRCgdUGeTpw4sshrfQ+
 OgzeXaTiUXztWDwsvfVswez3dVhC9XKW78WeKIeL9vProh7XgzHh/yNNHaOkKbLp0R
 5GvWh1nvD5M6wHg43pc6pK0Nk5JVTeniBdGgcrPo=
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

SGkgSnlyaSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gTW9uLCBEZWMgMDksIDIwMTkg
YXQgMDQ6NDI6MTVQTSArMDIwMCwgSnlyaSBTYXJoYSB3cm90ZToKPiBUaGUgInRpLHRpbGNkYyxw
YW5lbCIgYmluZGluZyBzaG91bGQgbm90IGJlIHVzZWQgYW55bW9yZSwgc2luY2UgdGlsY2RjCj4g
aXMgZnVsbHkgY2FwYWJsZSBvZiB1c2luZyBnZW5lcmljIGRybSBwYW5lbHMgbGlrZSBwYW5lbC1z
aW1wbGUgYW5kCj4gcGFuZWwtY29tbW9uIGJpbmRpbmcuIEhvd2V2ZXIsIHRoZSBvYnNvbGV0ZSBi
aW5kaW5nIGlzIHN0aWxsIHdpZGVseQo+IHVzZWQgaW4gbWFueSBtYWlubGluZSBzdXBwb3J0ZWQg
cGxhdGZvcm1zIHRoYXQgSSBkbyBub3QgaGF2ZSBhY2Nlc3MgdG8KPiBhbmQgd2hvIGtub3dzIGhv
dyBtYW55IGN1c3RvbSBwbGF0Zm9ybXMuIFNvIEkgYW0gYWZyYWlkIHdlIGhhdmUgdG8KPiBrZWVw
IHRoZSBvbGQgYnVuZGxlZCB0aWxjZGMgcGFuZWwgZHJpdmVyIGFyb3VuZC4KCkJ1dCBjYW4ndCB3
ZSBkcm9wIHRoZSBiaW5kaW5ncyBpbnN0ZWFkIG9mIG1hcmtpbmcgdGhlbSBhcyBvYnNvbGV0ZSwg
ZXZlbgppZiB3ZSBrZWVwIHRoZSBkcml2ZXIgYXJvdW5kIGZvciBzb21lIHRpbWUgPwoKQWxzbywg
d291bGQgaXQgbWFrZSBzZW5zZSB0byBzZXQgYSBkYXRlIGZvciB0aGUgcmVtb3ZhbCBvZiB0aGUg
ZHJpdmVyLAphbmQgYWRkIGl0IHRvIHRoZSBXQVJOKCkgbWVzc2FnZSBpbiBwYXRjaCAzLzMgPwoK
PiBTaWduZWQtb2ZmLWJ5OiBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPgo+IC0tLQo+ICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS90aWxjZGMvcGFuZWwudHh0IHwg
NiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS90aWxjZGMvcGFu
ZWwudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGlsY2Rj
L3BhbmVsLnR4dAo+IGluZGV4IDgwODIxNjMxMGVhMi4uNTQ5NjNmOTE3M2NjIDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3RpbGNkYy9wYW5l
bC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS90
aWxjZGMvcGFuZWwudHh0Cj4gQEAgLTEsNSArMSwxMSBAQAo+ICBEZXZpY2UtVHJlZSBiaW5kaW5n
cyBmb3IgdGlsY2RjIERSTSBnZW5lcmljIHBhbmVsIG91dHB1dCBkcml2ZXIKPiAgCj4gK05PVEU6
IFRoaXMgYmluZGluZyAoYW5kIHRoZSByZWxhdGVkIGRyaXZlcikgaXMgb2Jzb2xldGUgYW5kIHNo
b3VsZCBub3QKPiArICAgICAgYmUgdXNlZCBhbnltb3JlLiBQbGVhc2UgcmVmZXIgdG8gZHJtIHBh
bmVsLWNvbW1vbiBiaW5kaW5nIChhbmQKPiArICAgICAgdG8gYSBnZW5lcmljIGRybSBwYW5lbCBk
cml2ZXIgbGlrZSBwYW5lbC1zaW1wbGUpLgo+ICsgICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1jb21tb24ueWFtbAo+ICsgICAgICAoZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jKQo+ICsKPiAgUmVxdWlyZWQgcHJvcGVy
dGllczoKPiAgIC0gY29tcGF0aWJsZTogdmFsdWUgc2hvdWxkIGJlICJ0aSx0aWxjZGMscGFuZWwi
Lgo+ICAgLSBwYW5lbC1pbmZvOiBjb25maWd1cmF0aW9uIGluZm8gdG8gY29uZmlndXJlIExDREMg
Y29ycmVjdGx5IGZvciB0aGUgcGFuZWwKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
