Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E338F4DB02
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 22:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9686E7E2;
	Thu, 20 Jun 2019 20:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E996E7D8;
 Thu, 20 Jun 2019 20:14:43 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 514252BA;
 Thu, 20 Jun 2019 20:14:41 +0000 (UTC)
Date: Thu, 20 Jun 2019 14:14:40 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH] docs: fix some broken references due to txt->rst renames
Message-ID: <20190620141440.5e352241@lwn.net>
In-Reply-To: <6f09587b7678f2fb378d736f45a02ffa9412cc99.1560864716.git.mchehab+samsung@kernel.org>
References: <6f09587b7678f2fb378d736f45a02ffa9412cc99.1560864716.git.mchehab+samsung@kernel.org>
Organization: LWN.net
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>, dri-devel@lists.freedesktop.org,
 Ajay Gupta <ajayg@nvidia.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, linux-i2c@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Li Yang <leoyang.li@nxp.com>,
 Otto Sabart <ottosabart@seberm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxOCBKdW4gMjAxOSAxMDozMzo1OCAtMDMwMApNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToKCj4gaGVyZSBhcmUgdGhyZWUgbGVm
dC1vdmVycyBmcm9tIHRoZSByZWNlbnQgZmlsZSByZW5hbWVzLAo+IHByb2JhYmx5IGR1ZSB0byBz
b21lIG90aGVyIGNvbmZsaWN0aW5nIHBhdGNoLgo+IAo+IEZpeCB0aGVtLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitzYW1zdW5nQGtlcm5lbC5vcmc+
Cj4gLS0tCj4gCj4gVGhpcyBwYXRjaCBpcyBhZ2FpbnN0IHRvZGF5J3MgbmV4dC0yMDE5MDYxNyBi
cmFuY2guIE5vdCBzdXJlIGlmIGl0Cj4gd2lsbCBhcHBseSBjbGVhbmx5IGF0IC1kb2NzIHRyZWUu
IElmIG5vdCwgIFBsZWFzZSBsZXQgbWUga25vdyBmb3IgbWUgdG8KPiBzcGxpdC4KCkluZGVlZCBp
dCBkb2VzIG5vdDsgb25lIG9mIHRoZSBmaWxlcyBiZWluZyBwYXRjaGVkIGRvZXNuJ3QgZXZlbiBl
eGlzdCBpbgpteSB3b3JsZC4uLgoKam9uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
