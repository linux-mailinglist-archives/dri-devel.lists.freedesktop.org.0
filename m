Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E270C666BE
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 08:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90D36E2C7;
	Fri, 12 Jul 2019 06:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC78D6E2C7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 06:07:47 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C2829803AE;
 Fri, 12 Jul 2019 08:07:43 +0200 (CEST)
Date: Fri, 12 Jul 2019 08:07:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v6 0/3] drm/panel: simple: Add mode support to devicetree
Message-ID: <20190712060737.GA9569@ravnborg.org>
References: <20190711203455.125667-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190711203455.125667-1-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=O475EGwODiYbJdBmdVwA:9
 a=CjuIK1q_8ugA:10 a=PO69wPE_V6wA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>,
 mka@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91Zy4KCk9uIFRodSwgSnVsIDExLCAyMDE5IGF0IDAxOjM0OjUyUE0gLTA3MDAsIERvdWds
YXMgQW5kZXJzb24gd3JvdGU6Cj4gSSdtIHJldml2aW5nIFNlYW4gUGF1bCdzIG9sZCBwYXRjaHNl
dCB0byBnZXQgbW9kZSBzdXBwb3J0IGluIGRldmljZQo+IHRyZWUuICBUaGUgY292ZXIgbGV0dGVy
IGZvciBoaXMgdjMgaXMgYXQ6Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2
ZXMvZHJpLWRldmVsLzIwMTgtRmVicnVhcnkvMTY1MTYyLmh0bWwKPiAKPiB2NiBvZiB0aGlzIHBh
dGNoIGlzIGp1c3QgYSByZXBvc3Qgb2YgdGhlIDMgRFJNIHBhdGNoZXMgaW4gdjUgcmViYXNlZAo+
IGF0b3AgZHJtLW1pc2MuICBBIGZldyBub3RlczoKPiAtIEkndmUgZHJvcHBlZCB0aGUgYmluZGlu
Z3MgcGF0Y2guICBDb21taXQgODIxYTFmNzE3MWFlICgiZHQtYmluZGluZ3M6Cj4gICBkaXNwbGF5
OiBDb252ZXJ0IGNvbW1vbiBwYW5lbCBiaW5kaW5ncyB0byBEVCBzY2hlbWEiKSBoYXMgbGFuZGVk
IGFuZAo+ICAgUm9iIEggc2FpZCBbMV0gdGhhdCB3aGVuIHRoYXQgbGFuZGVkIHRoZSBiaW5kaW5n
cyB3ZXJlIGltcGxpY2l0bHkKPiAgIHN1cHBvcnRlZC4KPiAtIFNpbmNlIHRoZSBiaW5kaW5ncyBw
YXRjaCB3YXMgZHJvcHBlZCBJIGFtIGFzc3VtaW5nIHRoYXQgSGVpa28KPiAgIGNhbiBqdXN0IHBp
Y2sgdXAgdGhlIC5kdHMgcGF0Y2hlcyBmcm9tIHRoZSB2NSBzZXJpZXMuICBJCj4gICBkb3VibGUt
Y2hlY2tlZCB3aXRoIGhpbSBhbmQgaGUgY29uZmlybWVkIHRoaXMgaXMgZmluZS4gIFRodXMgSQo+
ICAgaGF2ZSBsZWZ0IHRoZSBkZXZpY2UgdHJlZSBwYXRjaGVzIG91dCBvZiB0aGlzIHZlcnNpb24u
Cj4gCj4gVGhlcmUgd2VyZSBzb21lIGNvZGluZyBzdHlsZSBkaXNjdXNzaW9ucyBvbiB2NSBvZiB0
aGUgcGF0aCBidXQgaXQncwo+IGJlZW4gYWdyZWVkIHRoYXQgd2UgY2FuIGxhbmQgdGhpcyBzZXJp
ZXMgYXMtaXMgYW5kIGFmdGVyIGl0IGxhbmRzIHdlCj4gY2FuIGFkZHJlc3MgdGhlIG1pbm9yIHN0
eWxlIGlzc3Vlcy4KPiAKPiBbMV0gaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci9DQUxfSnNxSkd0
VVRwSkwrU0RFS2kwOWFEVDR5RHpZNHg5S3dZbXowOE5hWmNuPW5IZkFAbWFpbC5nbWFpbC5jb20K
PiAKPiBDaGFuZ2VzIGluIHY2Ogo+IC0gUmViYXNlZCB0byBkcm0tbWlzYyBuZXh0Cj4gLSBBZGRl
ZCB0YWdzCi4uLgoKVGhhbmtzIGZvciB5b3VyIHBhdGllbmNlIHdpdGggdGhpcy4KQXBwbGllZCB0
byBkcm0tbWlzYy1uZXh0IGFuZCBwdXNoZWQgb3V0LgoKCVNhbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
