Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF2C1C6BB4
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 10:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FE36E82B;
	Wed,  6 May 2020 08:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459DF6E82B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 08:28:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id EA9C32A215D
Date: Wed, 6 May 2020 10:28:43 +0200
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200506082843.mkhip2n2uiimcf2z@rcn-XPS-13-9360>
Mail-Followup-To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 devicetree@vger.kernel.org, jason@lakedaemon.net,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506072155.6dmj35zdnr3to5ib@rcn-XPS-13-9360>
 <1cee742a-c16a-fb32-5caa-c6ac71689ab9@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cee742a-c16a-fb32-5caa-c6ac71689ab9@ti.com>
User-Agent: NeoMutt/20171215
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIG1pw6kgMDYtMDUtMjAyMCAxMTowMTowNywgVG9taSBWYWxrZWluZW4gd3Jv
dGU6IAo+IERvZXNuJ3QgYWxsIHRoaXMganVzdCBwb2ludCB0byBhIGJ1ZyBvciBtaXNzaW5nIGZl
YXR1cmUgaW4gZHRfYmluZGluZ19jaGVjaz8KPiBUaGF0J3Mgbm90IGEgcmVhc29uIHRvIGNoYW5n
ZSB0aGUgQUJJLgoKSSBhZ3JlZSBhbmQgSSdkIHZvdGUgZm9yICJtaXNzaW5nIGZlYXR1cmUiLCBi
dXQgc2VlaW5nIHRoYXQgdGhlcmUgYXJlbid0CmFueSBvdGhlciBleGFtcGxlcyBvZiB0aGlzIHVz
ZSBjYXNlIGluIHRoZSB3aG9sZSBrZXJuZWwgZHRzIGNvbGxlY3Rpb24KKGF0IGxlYXN0IEkgY291
bGRuJ3QgZmluZCBhbnkpIEkgdGhvdWdodCB0aGF0IG1heWJlIGl0J3MgdXMgd2hvIGFyZQpnb2lu
ZyBhZ2FpbnN0IHRoZSBub3JtIGhlcmUuCgpNYXliZSBSb2IgY2FuIHNoZWQgc29tZSBsaWdodCBh
Ym91dCB0aGlzPwoKQ2hlZXJzLApSaWNhcmRvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
