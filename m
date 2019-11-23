Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E9A107F01
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 16:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876906E0CB;
	Sat, 23 Nov 2019 15:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9C36E0CB
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2019 15:28:25 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 82F112008B;
 Sat, 23 Nov 2019 16:28:23 +0100 (CET)
Date: Sat, 23 Nov 2019 16:28:22 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/3] dt-bindings: panel: Document Frida FRD350H54004 LCD
 panel
Message-ID: <20191123152822.GB27045@ravnborg.org>
References: <20191120171027.1102250-1-paul@crapouillou.net>
 <20191120171027.1102250-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120171027.1102250-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=W2ngg1vp0vrSmQVp3HYA:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
 a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bC4KCk9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDA2OjEwOjI2UE0gKzAxMDAsIFBhdWwg
Q2VyY3VlaWwgd3JvdGU6Cj4gQWRkIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBGcmlk
YSAzLjUiICgzMjB4MjQwIHBpeGVscykgMjQtYml0Cj4gVEZUIExDRCBwYW5lbC4KCk5ldyBiaW5k
aW5ncyB1c2luZyB0aGUgbWV0YS1zY2hlbWEgKC55YW1sKSBzeW50YXggcGxlYXNlLgoKCVNhbQo+
IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+
IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9mcmlkYSxmcmQzNTBoNTQwMDQudHh0
ICAgIHwgMTIgKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9mcmlkYSxmcmQzNTBoNTQwMDQudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2ZyaWRhLGZyZDM1
MGg1NDAwNC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9mcmlkYSxmcmQzNTBoNTQwMDQudHh0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjg0MjhmOGIwNWI5Mwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9mcmlkYSxmcmQzNTBo
NTQwMDQudHh0Cj4gQEAgLTAsMCArMSwxMiBAQAo+ICtGcmlkYSAzLjUiICgzMjB4MjQwIHBpeGVs
cykgMjQtYml0IFRGVCBMQ0QgcGFuZWwKPiArCj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gKy0g
Y29tcGF0aWJsZTogc2hvdWxkIGJlICJmcmlkYSxmcmQzNTBoNTQwMDQiCj4gKy0gcG93ZXItc3Vw
cGx5OiBhcyBzcGVjaWZpZWQgaW4gdGhlIGJhc2UgYmluZGluZwo+ICsKPiArT3B0aW9uYWwgcHJv
cGVydGllczoKPiArLSBiYWNrbGlnaHQ6IGFzIHNwZWNpZmllZCBpbiB0aGUgYmFzZSBiaW5kaW5n
Cj4gKy0gZW5hYmxlLWdwaW9zOiBhcyBzcGVjaWZpZWQgaW4gdGhlIGJhc2UgYmluZGluZwo+ICsK
PiArVGhpcyBiaW5kaW5nIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgc2ltcGxlLXBhbmVsIGJpbmRp
bmcsIHdoaWNoIGlzIHNwZWNpZmllZAo+ICtpbiBzaW1wbGUtcGFuZWwudHh0IGluIHRoaXMgZGly
ZWN0b3J5Lgo+IC0tIAo+IDIuMjQuMApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
