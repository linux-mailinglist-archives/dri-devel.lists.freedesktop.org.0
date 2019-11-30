Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955E110DF8F
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 23:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655966E9AC;
	Sat, 30 Nov 2019 22:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4A76E9AC
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 22:15:38 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id DE53820027;
 Sat, 30 Nov 2019 23:15:34 +0100 (CET)
Date: Sat, 30 Nov 2019 23:15:33 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH V5 2/3] dt-bindings: Add Logic PD Type 28 display panel
Message-ID: <20191130221533.GC29715@ravnborg.org>
References: <20191016135147.7743-1-aford173@gmail.com>
 <20191016135147.7743-2-aford173@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016135147.7743-2-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=eRrw9GIQMXpSLQo85sUA:9 a=CjuIK1q_8ugA:10
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRhbS4KT24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMDg6NTE6NDZBTSAtMDUwMCwgQWRhbSBG
b3JkIHdyb3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBkb2N1bWVudGF0aW9uIG9mIGRldmljZSB0cmVl
IGJpbmRpbmdzIGZvciB0aGUgV1ZHQSBwYW5lbAo+IExvZ2ljIFBEIFR5cGUgMjggZGlzcGxheS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KPiAtLS0K
PiBWNTogIFJlcGxhY2UgR1BJT19BQ1RJVkVfSElHSCB3aXRoIDAgdG8gZml4IG1ha2UgZHRfYmlu
ZGluZ19jaGVjayAtawo+IFY0OiAgVXBkYXRlIHBlciBSb2IgSCdzIHN1Z2dlc3Rpb25zIGFuZCBj
b3B5IG90aGVyIHBhbmVsIHlhbWwgZXhhbXBsZSBmcm9tIDUuNC1yYzEKPiBWMzogIENvcnJlY3Qg
YnVpbGQgZXJyb3JzIGZyb20gJ21ha2UgZHRfYmluZGluZ19jaGVjaycKPiBWMjogIFVzZSBZQU1M
IGluc3RlYWQgb2YgVFhUIGZvciBiaW5kaW5nCj4gCgpBcHBsaWVkIHRvIGRybS1taXNjLW5leHQu
Ckl0IHdhcyBhcHBsaWVkIGJlZm9yZSB0aGUgZHJpdmVyIGNoYW5nZXMgc28gd2UgaGFkIGJpbmRp
bmdzCmZvciB0aGUgZHJpdmVyIGNoYW5nZXMgd2hlbiBhcHBsaWVkLgoKCVNhbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
