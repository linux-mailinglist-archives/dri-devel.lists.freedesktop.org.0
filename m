Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9C911F4
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 18:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97D36E4EC;
	Sat, 17 Aug 2019 16:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4B16E4EC
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 16:35:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8559C2004D;
 Sat, 17 Aug 2019 18:35:50 +0200 (CEST)
Date: Sat, 17 Aug 2019 18:35:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sidong Yang <realwakka@gmail.com>
Subject: Re: [PATCH] drm/arm: drop use of drmP.h
Message-ID: <20190817163549.GA15813@ravnborg.org>
References: <20190817074115.19116-1-realwakka@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190817074115.19116-1-realwakka@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=PZMyd2dMwuOkAlfwmFgA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2lkb25nCgpPbiBTYXQsIEF1ZyAxNywgMjAxOSBhdCAwODo0MToxNUFNICswMTAwLCBTaWRv
bmcgWWFuZyB3cm90ZToKPiBEcm9wIHVzZSBvZiBkZXByZWNhdGVkIGRybVAuaCBoZWFkZXIgZmls
ZS4KPiBSZW1vdmUgZHJtUC5oIGluY2x1ZGVzIGFuZCBhZGQgc29tZSBpbmNsdWRlIGhlYWRlcnMg
Zm9yIGZ1bmN0aW9uIG9yCj4gc3RydWN0IHRoYXQgdXNlZCBpbiBjb2RlLgoKVGhhbmtzIGZvciB5
b3VyIHBhdGNoLgpXZSBhbHJlYWR5IGhhdmUgYSBzaW1pbGlhciBwYXRjaCBpbiBkcm0tbWlzYy1u
ZXh0LCB0aGF0CmRyb3AgdGhlIHVzZSBvZiBkcm1QLmggZnJvbSBhcm0gc28gdGhpcyBwYXRjaCBp
cyBvYnNvbGV0ZWQuCgpCdXQga2VlcCB1cCB0aGUgc3Bpcml0IGFuZCBzZW5kIHVzIG90aGVyIGdv
b2Qgc3R1ZmYuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
