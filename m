Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D434610EE10
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 18:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7396E1B2;
	Mon,  2 Dec 2019 17:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3E96E1B2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 17:19:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCD9C309;
 Mon,  2 Dec 2019 18:19:26 +0100 (CET)
Date: Mon, 2 Dec 2019 19:19:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 20/21] dt-bindings: display: panel: Add the
 LTA089AC29000 variant
Message-ID: <20191202171920.GT4929@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-21-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-21-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575307167;
 bh=1myNRC7SsLatx4Um/XtlYnXlHXwV+S/+jv3sPPcyRGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oGIDxy1GY7K5W+sGA4pLqXht/OLU5+l+PsVZiMAWj+8UC1SLRQWNXj9CYnBzlDJOf
 Iv3zBXEGXH598Iar3g2xrJ6KszGwn2Xmkg+P1w0aDRfsNkMNgT6VFpGVBfz5vjckpT
 WEl3UZaRlwRE1ZPOyOCPpZgJRl/5WqYGc71OqC10=
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
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9yaXMsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFdlZCwgT2N0IDIzLCAyMDE5
IGF0IDA1OjQ1OjExUE0gKzAyMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiBUaGUgTFRBMDg5
QUMyOTAwMCBhbmQgTFQwODlBQzI5MDAwIGFyZSBub3QgZXhhY3RseSB0aGUgc2FtZS4gTGV0J3Mg
YWRkCj4gYSBuZXcgY29tcGF0aWJsZSBmb3IgdGhlIExUQSB2YXJpYW50LgoKV2hhdCBpcyB0aGUg
ZGlmZmVyZW5jZSA/IDotKQoKPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlz
LmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9w
YW5lbC90b3NoaWJhLGx0MDg5YWMyOTAwMC50eHQgICAgICAgICAgfCA1ICsrKystCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvdG9zaGli
YSxsdDA4OWFjMjkwMDAudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvdG9zaGliYSxsdDA4OWFjMjkwMDAudHh0Cj4gaW5kZXggODk4MjYxMTY2Mjhj
Li4yNmViZmEwOTg5NjYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvdG9zaGliYSxsdDA4OWFjMjkwMDAudHh0Cj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvdG9zaGliYSxsdDA4
OWFjMjkwMDAudHh0Cj4gQEAgLTEsNyArMSwxMCBAQAo+ICBUb3NoaWJhIDguOSIgV1hHQSAoMTI4
MHg3NjgpIFRGVCBMQ0QgcGFuZWwKPiAgCj4gIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gLS0gY29t
cGF0aWJsZTogc2hvdWxkIGJlICJ0b3NoaWJhLGx0MDg5YWMyOTAwMCIKPiArLSBjb21wYXRpYmxl
OiBzaG91bGQgYmUgb25lIG9mIHRoZSBmb2xsb3dpbmcKPiArCSAgICAgICJ0b3NoaWJhLGx0MDg5
YWMyOTAwMCIKPiArCSAgICAgICJ0b3NoaWJhLGx0YTA4OWFjMjkwMDAiCj4gKwo+ICAtIHBvd2Vy
LXN1cHBseTogYXMgc3BlY2lmaWVkIGluIHRoZSBiYXNlIGJpbmRpbmcKPiAgCj4gIFRoaXMgYmlu
ZGluZyBpcyBjb21wYXRpYmxlIHdpdGggdGhlIHNpbXBsZS1wYW5lbCBiaW5kaW5nLCB3aGljaCBp
cyBzcGVjaWZpZWQKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
