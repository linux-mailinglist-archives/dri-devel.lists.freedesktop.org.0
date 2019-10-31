Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA79FEB0CB
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 14:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5B76EE72;
	Thu, 31 Oct 2019 13:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3836EE72
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 13:04:15 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3442B290624;
 Thu, 31 Oct 2019 13:04:13 +0000 (GMT)
Date: Thu, 31 Oct 2019 14:04:10 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 17/21] dt-bindings: display: bridge:
 lvds-transmitter: Add new props
Message-ID: <20191031140410.47fca3ff@collabora.com>
In-Reply-To: <20191025195711.GA1074@bogus>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-18-boris.brezillon@collabora.com>
 <20191025195711.GA1074@bogus>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNSBPY3QgMjAxOSAxNDo1NzoxMSAtMDUwMApSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gT24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDU6NDU6MDhQTSArMDIw
MCwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+ID4gQWRkIHRoZSBkYXRhLW1hcHBpbmcgcHJvcGVy
dHkgdG8gZGVzY3JpYmUgdGhlIG91dHB1dCBidXMgZm9ybWF0IGFuZAo+ID4gdGhlIGJ1cy13aWR0
aCBwcm9wZXJ0eSB0byBkZXNjcmliZSB0aGUgaW5wdXQgYnVzIGZvcm1hdC4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNv
bT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2MzoKPiA+ICogTmV3IHBhdGNoCj4gPiAtLS0KPiA+
ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50eHQgICAgfCAx
MyArKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnR4dAo+ID4gaW5kZXgg
NjAwOTFkYjVkZmE1Li43YjQzYjZmMjAyNzkgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50eHQK
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9sdmRzLXRyYW5zbWl0dGVyLnR4dAo+ID4gQEAgLTM2LDYgKzM2LDE5IEBAIGdyYXBoIGJpbmRp
bmdzIHNwZWNpZmllZCBpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3JhcGgu
dHh0Lgo+ID4gIC0gVmlkZW8gcG9ydCAwIGZvciBwYXJhbGxlbCBpbnB1dAo+ID4gIC0gVmlkZW8g
cG9ydCAxIGZvciBMVkRTIG91dHB1dAo+ID4gIAo+ID4gK09wdGlvbmFsIHBvcnQgMCBub2RlIHBy
b3BlcnRpZXM6Cj4gPiArCj4gPiArLSBidXMtd2lkdGg6IG51bWJlciBvZiBkYXRhIGxpbmVzIHVz
ZSB0byB0cmFuc21pdCB0aGUgUkdCIGRhdGEuCj4gPiArCSAgICAgQ2FuIGJlIDE4IG9yIDI0Lgo+
ID4gKwo+ID4gK09wdGlvbmFsIHBvcnQgMSBub2RlIHByb3BlcnRpZXM6Cj4gPiArCj4gPiArLSBk
YXRhLW1hcHBpbmc6IHNlZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9sdmRzLnlhbWwKPiA+ICsJCWZvciBtb3JlIGRldGFpbHMgYWJvdXQgdGhpcyBMVkRT
IGRhdGEtbWFwcGluZyBwcm9wZXJ0eS4KPiA+ICsJCVN1cHBvcnRlZCB2YWx1ZXM6Cj4gPiArCQki
amVpZGEtMTgiCj4gPiArCQkiamVpZGEtMjQiCj4gPiArCQkidmVzYS0yNCIgIAo+IAo+IFRoaXMg
aXMgYWxyZWFkeSBkZWZpbmVkIHRvIGJlIGEgcGFuZWwgcHJvcGVydHkuIERvIHdlIG5lZWQgaXQg
YXQgYm90aCAKPiBlbmRzPwoKVGhhdCdzIGEgdmFsaWQgcG9pbnQuIEknbGwgcGF0Y2ggdGhlIHBh
bmVsLXNpbXBsZSBkcml2ZXIgdG8gdGFrZXMgdGhpcwpEVCBwcm9wIGludG8gYWNjb3VudC4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
