Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBEB60B02
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 19:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E388B6E519;
	Fri,  5 Jul 2019 17:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCCA6E519
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 17:23:41 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 89D6980513;
 Fri,  5 Jul 2019 19:23:39 +0200 (CEST)
Date: Fri, 5 Jul 2019 19:23:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: panel: Add Sharp LD-D5116Z01B
Message-ID: <20190705172338.GB2788@ravnborg.org>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
 <20190705165655.456-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705165655.456-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=X-qxmLeW_QAlauPjm30A:9 a=CjuIK1q_8ugA:10
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmVmZnJleS4KCk9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0IDA5OjU2OjU1QU0gLTA3MDAsIEpl
ZmZyZXkgSHVnbyB3cm90ZToKPiBUaGUgU2hhcnAgTEQtRDUxMTZaMDFCIGlzIGEgMTIuMyIgZURQ
IHBhbmVsIHdpdGggYSAxOTIwWDEyODAgcmVzb2x1dGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
ZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4KPiAtLS0KPiAgLi4uL2Rpc3Bs
YXkvcGFuZWwvc2hhcnAsbGQtZDUxMTZ6MDFiLnR4dCAgICAgIHwgMjcgKysrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2hh
cnAsbGQtZDUxMTZ6MDFiLnR4dAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaGFycCxsZC1kNTExNnowMWIudHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbGQtZDUx
MTZ6MDFiLnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4z
OTM4YzI4NDdmZTUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbGQtZDUxMTZ6MDFiLnR4dAo+IEBAIC0w
LDAgKzEsMjcgQEAKPiArU2hhcnAgTEQtRDUxMTZaMDFCIDEyLjMiIFdVWEdBKyBlRFAgcGFuZWwK
PiArCj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJz
aGFycCxsZC1kNTExNnowMWIiCj4gKy0gcG93ZXItc3VwcGx5OiByZWd1bGF0b3IgdG8gcHJvdmlk
ZSB0aGUgVkNDIHN1cHBseSB2b2x0YWdlICgzLjMgdm9sdHMpCj4gKwo+ICtUaGlzIGJpbmRpbmcg
aXMgY29tcGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZy4KPiArCj4gK1RoZSBk
ZXZpY2Ugbm9kZSBjYW4gY29udGFpbiBvbmUgJ3BvcnQnIGNoaWxkIG5vZGUgd2l0aCBvbmUgY2hp
bGQKPiArJ2VuZHBvaW50JyBub2RlLCBhY2NvcmRpbmcgdG8gdGhlIGJpbmRpbmdzIGRlZmluZWQg
aW4gWzFdLiBUaGlzCj4gK25vZGUgc2hvdWxkIGRlc2NyaWJlIHBhbmVsJ3MgdmlkZW8gYnVzLgo+
ICsKPiArWzFdOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8t
aW50ZXJmYWNlcy50eHQKPiArCj4gK0V4YW1wbGU6Cj4gKwo+ICsJcGFuZWw6IHBhbmVsIHsKPiAr
CQljb21wYXRpYmxlID0gInNoYXJwLGxkLWQ1MTE2ejAxYiI7Cj4gKwkJcG93ZXItc3VwcGx5ID0g
PCZ2bGNkXzN2Mz47Cj4gKwkJbm8taHBkClRoZSBiaW5kaW5nIGRvIG5vdCBtZW50aW9uIG5vLWhw
ZCAtIGJ1dCBpdCBpcyBwYXJ0IG9mIHBhbmVsLXNpbXBsZQpiaW5kaW5nLiBJcyBpdCBpbmNsdWRl
ZCBpbiB0aGUgZXhhbXBsZSBmb3IgYW55IHNwZWNpYWwgcmVhc29uPwoKQWxzbyB0aGVyZSBpcyBh
IHN5bnRheCBlcnJvciwgIjsiIGlzIG1pc3NpbmcuCgoKCVNhbQoKPiArCj4gKwkJcG9ydCB7Cj4g
KwkJCXBhbmVsX2VwOiBlbmRwb2ludCB7Cj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmJyaWRn
ZV9vdXRfZXA+Owo+ICsJCQl9Owo+ICsJCX07Cj4gKwl9Owo+IC0tIAo+IDIuMTcuMQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
