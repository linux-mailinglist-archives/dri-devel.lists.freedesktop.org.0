Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816C4765FE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 14:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E12C6ED36;
	Fri, 26 Jul 2019 12:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CB66ED36
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 12:36:29 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A8FC880482;
 Fri, 26 Jul 2019 14:36:26 +0200 (CEST)
Date: Fri, 26 Jul 2019 14:36:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v2 0/2] Add Sharp panel option for Lenovo Miix 630
Message-ID: <20190726123625.GA17037@ravnborg.org>
References: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=HQdGnUN6SEKGFpM_q2QA:9 a=CjuIK1q_8ugA:10
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

SGkgSmVmZnJleS4KCk9uIE1vbiwgSnVsIDA4LCAyMDE5IGF0IDA5OjU2OjQ3QU0gLTA3MDAsIEpl
ZmZyZXkgSHVnbyB3cm90ZToKPiBUaGUgTGVub3ZvIE1paXggNjMwIGxhcHRvcCBjYW4gYmUgZm91
bmQgd2l0aCBvbmUgb2YgdHdvIHBhbmVscyAtIGEgQk9FCj4gb3IgU2hhcnAgb3B0aW9uLiAgVGhp
cyBsaWtlbHkgcHJvdmlkZXMgb3B0aW9ucyBkdXJpbmcgbWFudWZhY3R1cmluZy4KPiAKPiBUaGVz
ZSBwYW5lbHMgY29ubmVjdCB2aWEgZURQLCBob3dldmVyIHRoZXkgc2l0IGJlaGluZCBhIERTSSB0
byBlRFAKPiBicmlkZ2Ugb24gdGhlIGxhcHRvcCwgc28gdGhleSBjYW4gZWFzaWx5IGJlIGhhbmRs
ZWQgYnkgdGhlIGV4aXN0aW5nCj4gc2ltcGxlIHBhbmVsIGNvZGUuCj4gCj4gVGhpcyBzZXJpZXMg
YWRkcyBzdXBwb3J0IGZvciB0aGUgU2hhcnAgb3B0aW9uLgo+IAo+IHYyOgo+IC1yZW1vdmVkIG5v
LWhwZCBmcm9tIGR0IGV4YW1wbGUKPiAtYWRkZWQgLmJ1c19mb3JtYXQgYW5kIC5idXNfZmxhZ3Mg
ZmllbGRzIGJhc2VkIG9uIHJldmlld3MKPiAtYWRkZWQgLmZsYWdzIGFmdGVyIEJqb3JuIHBvaW50
ZWQgbWUgdG8gc29tZXRoaW5nIEkgbWlzc2VkCj4gLWFkZGVkIFNhbSdzIHJldmlld2VkLWJ5IHRh
Z3MKPiAKPiBKZWZmcmV5IEh1Z28gKDIpOgo+ICAgZHQtYmluZGluZ3M6IHBhbmVsOiBBZGQgU2hh
cnAgTEQtRDUxMTZaMDFCCj4gICBkcm0vcGFuZWw6IHNpbXBsZTogQWRkIHN1cHBvcnQgZm9yIFNo
YXJwIExELUQ1MTE2WjAxQiBwYW5lbAoKVGhhbmtzLgpCb3RoIHBhdGNoZXMgYXBwbGllZCBhbmQg
cHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgpBcmUgeW91IHVwIHRvIGEgbGl0dGxlIGphbml0b3Jp
YWwgd29yaz8KVG9kYXkgdGhlIHByZWZlcnJlZCBmb3JtYXQgZm9yIGJpbmRpbmdzIGZpbGVzIGFy
ZSB0aGUgbmV3IHlhbWwgZm9ybWF0LgpDb3VsZCB5b3UgdXBkYXRlICd5b3VyJyBmaWxlLCBhbmQg
bWF5YmUgdGhlIG90aGVyIHNoYXJwIGZpbGVzIHRvbz8KSXQgd291bGQgYmUgZ29vZCB0byBoYXZl
IHNvbWUgcHJvZ3Jlc3MgaW4gdGhpcy4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
