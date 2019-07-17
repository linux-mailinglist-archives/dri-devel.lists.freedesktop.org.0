Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 330C06C0DB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 20:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9356E118;
	Wed, 17 Jul 2019 18:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B776E118
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 18:14:59 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C0BCD20020;
 Wed, 17 Jul 2019 20:14:56 +0200 (CEST)
Date: Wed, 17 Jul 2019 20:14:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Letux-kernel] [PATCH v3 0/5] drm/panel-simple: Add panel
 parameters for ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
Message-ID: <20190717181455.GB6522@ravnborg.org>
References: <cover.1559905870.git.hns@goldelico.com>
 <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com>
 <20190625204356.GF18595@ravnborg.org>
 <20190626073350.GA15288@ravnborg.org>
 <CF1D9929-58D2-4E75-932A-870D11BBFBDE@goldelico.com>
 <33D92C0E-A430-4C34-A698-646F2592093D@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33D92C0E-A430-4C34-A698-646F2592093D@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=ECr_sb-4hz7xPOuor7MA:9 a=CjuIK1q_8ugA:10
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 David Airlie <airlied@linux.ie>, Belisko Marek <marek.belisko@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmlrb2xhdXMuCgo+ID4+Pj4gQlRXOiBzaG91bGQgYWxzbyBiZSBhcHBsaWVkIHRvIDUuMgo+
ID4+PiBUaGUgZHJtIGJpdHMgYXJlIHJldmlld2VkLiBUaGUgRFQgYml0cyBuZWVkcyBPSyBmcm9t
IERUIHBlb3BsZS4KPiA+Pj4gV2hlbiB3ZSBoYXZlIE9LIGZyb20gRFQgcGVvcGxlIHdlIGNhbiBh
cHBseSB0aGVtIGFsbCB0byBkcm0tbWlzYy1uZXh0Lgo+ID4+IAo+ID4+IEkgZ290IE9LIG9uIGly
YyBmcm9tIFJvYiB0byBwcm9jZXNzIHRoZXNlLgo+ID4+IEFsbCBwYXRjaGVzIGFyZSBub3cgYXBw
bGllZCB0byBkcm0tbWlzYy1uZXh0Lgo+ID4gCj4gPiBUaGFua3MgZm9yIHRha2luZyBjYXJlIG9m
IHRoaXMhCj4gCj4gSSBoYXZlIGNoZWNrZWQgYnV0IGl0IHNlZW1zIHRoZXkgYXJlIHN0aWxsIG5v
dCBtZXJnZWQgaW50byBsaW51eC1uZXh0LgoKVGhleSB3aWxsIGFwcGVhciBpbiBuZXh0IG1lcmdl
IHdpbmRvdy4gVGhleSB3ZXJlIHRvIGxhdGUgdG8gaGl0IGN1cnJlbnQKbWVyZ2Ugd2luZG93LCBh
cyB0aGUgY3V0LW9mIHRpbWUgaXMgYXJvdW5kIC5yYzUgaW4gdGhlIGRybSBzdWJzeXN0ZW0uCkFu
ZCB0aGlzIGlzIG5vdCByZWFsbHkgYSBmaXggc28gbm90IHN0YWJsZSBtYXRlcmlhbC4KCglTYW0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
