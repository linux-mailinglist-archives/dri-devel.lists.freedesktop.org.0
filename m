Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BB937A19
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 18:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0569892F6;
	Thu,  6 Jun 2019 16:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25319892F6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 16:53:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBA6333B;
 Thu,  6 Jun 2019 18:53:11 +0200 (CEST)
Date: Thu, 6 Jun 2019 19:52:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 02/20] dt-bindings: display, renesas,du: Document cmms
 property
Message-ID: <20190606165257.GJ12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-3-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559839991;
 bh=tOU1DPqgtzYWV6dcVYsaOM6vAbyR5dvopinvYtXfsAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X2LFSAvI++z6oE1SYWy0VykF2ETXjBbx1dAqkMSKuMzcFxSS1fr2cg1jemYUF9xw0
 cHALCR3cGZqU3NRl6COU0JK31Avb/TX4XawbfsKvd+svD0jPqSrtIUEi2KidJvW/Qg
 61MtX4jP/7UQ33TcMCBKjKb894MPF/KiWbQexCAE=
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
OSBhdCAwNDoyMjowMlBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gRG9jdW1lbnQgdGhl
IG5ld2x5IGFkZGVkICdjbW1zJyBwcm9wZXJ0eSB3aGljaCBhY2NlcHRzIGEgbGlzdCBvZiBwaGFu
ZGxlCj4gYW5kIGNoYW5uZWwgaW5kZXggcGFpcnMgdGhhdCBwb2ludCB0byB0aGUgQ01NIHVuaXRz
IGF2YWlsYWJsZSBmb3IgZWFjaAo+IERpc3BsYXkgVW5pdCBvdXRwdXQgdmlkZW8gY2hhbm5lbC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5v
cmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Jl
bmVzYXMsZHUudHh0IHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3JlbmVzYXMsZHUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcmVuZXNhcyxkdS50eHQKPiBpbmRleCBhZWRiMjJiNGQxNjEuLjEwMDExNGVmMTFkNSAx
MDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9y
ZW5lc2FzLGR1LnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3JlbmVzYXMsZHUudHh0Cj4gQEAgLTQ0LDYgKzQ0LDEwIEBAIFJlcXVpcmVkIFByb3Bl
cnRpZXM6Cj4gICAgICBpbnN0YW5jZSB0aGF0IHNlcnZlcyB0aGUgRFUgY2hhbm5lbCwgYW5kIHRo
ZSBjaGFubmVsIGluZGV4IGlkZW50aWZpZXMgdGhlCj4gICAgICBMSUYgaW5zdGFuY2UgaW4gdGhh
dCBWU1AuCj4gIAo+ICsgIC0gY21tczogQSBsaXN0IG9mIHBoYW5kbGVzIHRvIHRoZSBDTU0gaW5z
dGFuY2VzIHByZXNlbnQgaW4gdGhlIFNvQywgb25lCj4gKyAgICBmb3IgZWFjaCBhdmFpbGFibGUg
RFUgY2hhbm5lbC4gVGhlIHByb3BlcnR5IHNoYWxsIG5vdCBiZSBzcGVjaWZpZWQgZm9yCj4gKyAg
ICBTb0NzIHRoYXQgZG9lcyBub3QgcHJvdmlkZSBhbnkgQ01NIChzdWNoIGFzIFYzTSBhbmQgVjNI
KS4KCnMvZG9lcy9kby8KClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cgo+ICsKPiAgUmVxdWlyZWQgbm9kZXM6Cj4gIAo+ICBU
aGUgY29ubmVjdGlvbnMgdG8gdGhlIERVIG91dHB1dCB2aWRlbyBwb3J0cyBhcmUgbW9kZWxlZCB1
c2luZyB0aGUgT0YgZ3JhcGgKPiBAQCAtODksNiArOTMsNyBAQCBFeGFtcGxlOiBSOEE3Nzk1IChS
LUNhciBIMykgRVMyLjAgRFUKPiAgCQkJIDwmY3BnIENQR19NT0QgNzIxPjsKPiAgCQljbG9jay1u
YW1lcyA9ICJkdS4wIiwgImR1LjEiLCAiZHUuMiIsICJkdS4zIjsKPiAgCQl2c3BzID0gPCZ2c3Bk
MCAwPiwgPCZ2c3BkMSAwPiwgPCZ2c3BkMiAwPiwgPCZ2c3BkMCAxPjsKPiArCQljbW1zID0gPCZj
bW0wICZjbW0xICZjbW0yICZjbW0zPjsKPiAgCj4gIAkJcG9ydHMgewo+ICAJCQkjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
