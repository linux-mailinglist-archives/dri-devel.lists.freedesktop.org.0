Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC513864D
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E1989CB3;
	Sun, 12 Jan 2020 12:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A8888AA1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 08:00:12 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 846836000E;
 Fri, 10 Jan 2020 08:00:04 +0000 (UTC)
Date: Fri, 10 Jan 2020 09:00:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: display: simple: Add Satoz panel
Message-ID: <20200110090003.1e233d15@xps13>
In-Reply-To: <20200109193203.GA22666@ravnborg.org>
References: <20200109184037.9091-1-miquel.raynal@bootlin.com>
 <20200109193203.GA22666@ravnborg.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IHdyb3RlIG9uIFRodSwgOSBK
YW4gMjAyMCAyMDozMjowMyArMDEwMDoKCj4gSGkgTWlxdWVsLgo+IAo+IE9uIFRodSwgSmFuIDA5
LCAyMDIwIGF0IDA3OjQwOjM2UE0gKzAxMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBTYXRv
eiBpcyBhIENoaW5lc2UgVEZUIG1hbnVmYWN0dXJlci4KPiA+IFdlYnNpdGU6IGh0dHA6Ly93d3cu
c2F0LXN6LmNvbS9FbmdsaXNoL2luZGV4Lmh0bWwKPiA+IAo+ID4gQWRkIHRoZSBjb21wYXRpYmxl
IGZvciBpdHMgU0FUMDUwQVQ0MEgxMlIyIDUuMCBpbmNoIExDRCBwYW5lbC4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gIAo+
IAo+IEFwcGxpZWQgdGhpcyBhbmQgdGhlIGZvbGxvd2luZyBwYXRjaCB0byBkcm0tbWlzYy1uZXh0
Lgo+IEkgbWFudWFsbHkgcmVzb2x2ZWQgdGhlIGNvbmZsaWN0IGluIHBhbmVsLXNpbXBsZS55YW1s
LgoKVGhhbmtzIGZvciB5b3VyIHdvcmssIFNhbSwgdGhpcyBpcyB2ZXJ5IGFwcHJlY2lhdGVkLgoK
Q2hlZXJzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
