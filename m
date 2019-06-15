Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A4E4716C
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 19:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1242489135;
	Sat, 15 Jun 2019 17:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353D989135
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 17:33:05 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BA2A21841;
 Sat, 15 Jun 2019 17:33:04 +0000 (UTC)
Date: Sat, 15 Jun 2019 19:33:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shobhit Kukreti <shobhitkukreti@gmail.com>
Subject: Re: [PATCH] staging: fbtft: Fix checkpatch ERROR: space prohibited
 before that close parenthesis ')'
Message-ID: <20190615173302.GB4914@kroah.com>
References: <20190614023225.GA27938@t-1000>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614023225.GA27938@t-1000>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560619985;
 bh=WGXI8jXG0pKfq2SJo5cutcD1R3GEYJqxwZCDZAfx5/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vhyOA3qKzYPZ7gnbY9LxRLHZl5uU4g7RBi63PuoHo/ljxYZz0uMtZJ5dVVwMBtc7L
 rUfN8DBIZhRsl4vpkJYFgIRCNlGjwBoz+tmwrVncGcXdi6WREwYzpg5ViH7+cPnv+Y
 IhxZPapatIjP86VWnebmCvJ9ZcAtv3l2xOxKJRM4=
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDc6MzI6MjhQTSAtMDcwMCwgU2hvYmhpdCBLdWtyZXRp
IHdyb3RlOgo+IENsZWFuZWQgdXAgY29kZSB0byByZXNvbHZlICB0aGUgY2hlY2twYXRjaCBlcnJv
cgo+IEVSUk9SOiBzcGFjZSBwcm9oaWJpdGVkIGJlZm9yZSB0aGF0IGNsb3NlIHBhcmVudGhlc2lz
ICcpJwo+IGZyb20gdGhlIGZpbGU6Cj4gCj4gZmJ0ZnQvZmJ0ZnQtYnVzLmMKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTaG9iaGl0IEt1a3JldGkgPHNob2JoaXRrdWtyZXRpQGdtYWlsLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWJ1cy5jIHwgNCArKy0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1idXMuYyBiL2RyaXZlcnMvc3RhZ2luZy9mYnRm
dC9mYnRmdC1idXMuYwo+IGluZGV4IDJlYTgxNGQuLjJiNDNiYzIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWJ1cy5jCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2Zi
dGZ0L2ZidGZ0LWJ1cy5jCj4gQEAgLTYyLDkgKzYyLDkgQEAgb3V0OgkJCQkJCQkJCSAgICAgIFwK
PiAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICBFWFBPUlRfU1lNQk9MKGZ1bmMpOwo+ICAKPiAt
ZGVmaW5lX2ZidGZ0X3dyaXRlX3JlZyhmYnRmdF93cml0ZV9yZWc4X2J1czgsIHU4LCB1OCwgKQo+
ICtkZWZpbmVfZmJ0ZnRfd3JpdGVfcmVnKGZidGZ0X3dyaXRlX3JlZzhfYnVzOCwgdTgsIHU4LCkK
PiAgZGVmaW5lX2ZidGZ0X3dyaXRlX3JlZyhmYnRmdF93cml0ZV9yZWcxNl9idXM4LCBfX2JlMTYs
IHUxNiwgY3B1X3RvX2JlMTYpCj4gLWRlZmluZV9mYnRmdF93cml0ZV9yZWcoZmJ0ZnRfd3JpdGVf
cmVnMTZfYnVzMTYsIHUxNiwgdTE2LCApCj4gK2RlZmluZV9mYnRmdF93cml0ZV9yZWcoZmJ0ZnRf
d3JpdGVfcmVnMTZfYnVzMTYsIHUxNiwgdTE2LCkKCldpbGwgdGhpcyBzdGlsbCBidWlsZD8gIEkg
dGhvdWdodCBJIHJlbWVtYmVyIHNvbWUgb2xkIHZlcnNpb25zIG9mIGdjYwpub3QgbGlraW5nIHRo
aXMuLi4KCkRpZCB5b3UgdGVzdCB0aGlzIHBhdGNoIG91dD8KCnRoYW5rcywKCmdyZWcgay1oCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
