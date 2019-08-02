Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E097E7EDC0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 09:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3E76ECDE;
	Fri,  2 Aug 2019 07:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801636ECDE
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 07:44:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A89BCC;
 Fri,  2 Aug 2019 09:44:31 +0200 (CEST)
Date: Fri, 2 Aug 2019 10:44:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH/RFC 02/12] dt-bindings: display: renesas: lvds: Document
 renesas,swap-data
Message-ID: <20190802074428.GB5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564731249-22671-3-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564731871;
 bh=gzvUj9jd2PrydwNYpFTgEXGs5eg5KFldPERSdboetlo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qxJvg6D+26dP4y9USt76anVWBn0L0OikGL59FHRGFoAhYRXaRfWX8Bqq04mgxBUDZ
 VZiKM+TQ8c+HjkjimTUyjcrDktGsaYxwgaA9L5SDaUGN1ip/ahbBVwDEI6x1VxAW5j
 /JsZIUmCNIky3Q1rv0w8CTnHlNO5Zc6m3+FWCOLk=
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
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIEZyaSwgQXVnIDAyLCAy
MDE5IGF0IDA4OjMzOjU5QU0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBSLUNhciBE
MywgUi1DYXIgRTMsIGFuZCBSWi9HMkUgc3VwcG9ydCBkdWFsLWxpbmsgbW9kZS4KPiBJbiBzdWNo
IGEgbW9kZSwgdGhlIGZpcnN0IExWRFMgZW5jb2RlciBlbWl0cyBldmVuIGRhdGEsIGFuZCB0aGUK
PiBzZWNvbmQgTFZEUyBlbmNvZGVyIGVtaXRzIG9kZCBkYXRhLiBUaGlzIHBhdGNoIGRvY3VtZW50
cyBwcm9wZXJ0eQo+IHJlbmVzYXMsc3dhcC1kYXRhLCB1c2VkIHRvIHN3YXAgZXZlbiBhbmQgb2Rk
IGRhdGEgYXJvdW5kLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6
aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dCB8IDUgKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5l
c2FzLGx2ZHMudHh0Cj4gaW5kZXggZGVjZTc5ZS4uODk4MDE3OSAxMDA2NDQKPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRz
LnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9yZW5lc2FzLGx2ZHMudHh0Cj4gQEAgLTUyLDYgKzUyLDExIEBAIE9wdGlvbmFsIHByb3Bl
cnRpZXM6Cj4gICAgbWFuZGF0b3J5IGZvciB0aGUgZmlyc3QgTFZEUyBlbmNvZGVyIG9uIFItQ2Fy
IEQzLCBSLUNhciBFMywgYW5kIFJaL0cyRSBTb0NzLAo+ICAgIGFuZCBzaGFsbCBwb2ludCB0byB0
aGUgc2Vjb25kIGVuY29kZXIgdG8gYmUgdXNlZCBhcyBhIGNvbXBhbmlvbiBpbiBkdWFsLWxpbmsK
PiAgICBtb2RlLiBJdCBzaGFsbCBub3QgYmUgc2V0IGZvciBhbnkgb3RoZXIgTFZEUyBlbmNvZGVy
Lgo+ICstIHJlbmVzYXMsc3dhcC1kYXRhIDogd2hlbiBpbiBkdWFsLWxpbmsgbW9kZSwgdGhlIGZp
cnN0IExWRFMgZW5jb2RlciBub3JtYWxseQo+ICsgIGVtaXRzIGV2ZW4gZGF0YSwgYW5kIHRoZSBz
ZWNvbmQgTFZEUyBlbmNvZGVyIGVtaXRzIG9kZCBkYXRhLiBXaGVuIHByb3BlcnR5Cj4gKyAgcmVu
ZXNhcyxzd2FwLWRhdGEgaXMgc3BlY2lmaWVkLCB0aGUgZGF0YSBlbWl0dGVkIGJ5IHRoZSB0d28g
ZW5jb2RlcnMgd2lsbCBiZQo+ICsgIHN3YXBwZWQgYXJvdW5kLiBUaGlzIHByb3BlcnR5IGNhbiBv
bmx5IGJlIHVzZWQgaW4gY29uanVuY3Rpb24gd2l0aCBwcm9wZXJ0eQo+ICsgIHJlbmVzYXMsY29t
cGFuaW9uLgoKRnJvbSBhbiBMVkRTIGVuY29kZXIgcG9pbnQgb2YgdmlldyB0aGlzIGlzIG1vcmUg
YSBjb25maWd1cmF0aW9uIG9wdGlvbgp0aGFuIGEgZGVzY3JpcHRpb24gb2YgdGhlIGhhcmR3YXJl
LiBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgZm9yIHRoZSBMVkRTCnNpbmsgdG8gcmVwb3J0IHdoaWNo
IG9mIHRoZSBvZGQgb3IgZXZlbiBwaXhlbHMgaXQgZXhwZWN0cyBvbiBlYWNoIG9mIGl0cwplbmRw
b2ludHMgPyBUaGUgTFZEUyBlbmNvZGVyIGRyaXZlciBjb3VsZCB0aGVuIHF1ZXJ5IHRoYXQgYXQg
cnVudGltZSBhbmQKY29uZmlndXJlIGl0c2VsZiBhY2NvcmRpbmdseS4gSWRlYWxseSB0aGlzIHNo
b3VsZCBiZSBxdWVyaWVkIHRocm91Z2ggdGhlCmRybV9icmlkZ2VfdGltaW5ncyBzdHJ1Y3R1cmUg
KG9yIHRocm91Z2ggYSBzaW1pbGFyIG1lYW4pLCBub3QgdGhyb3VnaApEVC4gQW4gTFZEUyBzaW5r
IHRoYXQgaGFzIGEgZml4ZWQgbWFwcGluZyBvZiBvZGQvZXZlbiBwaXhlbHMgdG8KZW5kcG9pbnRz
IHdvdWxkbid0IG5lZWQgdGhlIGluZm9ybWF0aW9uIHRvIGJlIHNwZWNpZmllZCBpbiBEVCBhdCBh
bGwuCgo+ICAKPiAgCj4gIEV4YW1wbGU6CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
