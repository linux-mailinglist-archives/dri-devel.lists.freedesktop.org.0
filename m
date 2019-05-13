Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2189B1C40D
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 09:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CBA89237;
	Tue, 14 May 2019 07:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rosenzweig.io (rosenzweig.io [107.170.207.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C0D8972D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:56:18 +0000 (UTC)
Received: by rosenzweig.io (Postfix, from userid 1000)
 id D9E1B60AC9; Mon, 13 May 2019 07:56:17 -0700 (PDT)
Date: Mon, 13 May 2019 07:56:17 -0700
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 0/3] drm/panfrost: Expose HW counters to userspace
Message-ID: <20190513145617.GC7502@rosenzweig.io>
References: <20190404152051.17996-1-boris.brezillon@collabora.com>
 <ba54e655-6316-8d36-dfd1-c5df418cee3a@arm.com>
 <20190430144238.49963521@collabora.com>
 <20190511223220.GA15155@rosenzweig.io>
 <20190512153803.471ef410@collabora.com>
 <028546a0-546a-b788-567a-a45623d16f5e@arm.com>
 <20190513153952.68adf596@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513153952.68adf596@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 14 May 2019 07:40:44 +0000
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Janes <mark.a.janes@intel.com>, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBUaGlzIGJlaW5nIHNhaWQsIEkgdGhpbmsgSSdsbCBnbyBmb3IgYSBzaW1wbGUgZGVidWdmcy1i
YXNlZCBpZmFjZSB0bwo+IHVuYmxvY2sgQWx5c3NhLiBkZWJ1Z2ZzIGlzIG5vdCBwYXJ0IG9mIHRo
ZSBzdGFibGUtQUJJIGFuZCBJIGd1ZXNzIHdlCj4gY2FuIGFncmVlIG9uIGV4cGxpY2l0bHkgbWFy
a2luZyBpdCBhcyAidW5zdGFibGUiIHNvIHRoYXQgd2hlbiB3ZSBzZXR0bGUKPiBvbiBhIGdlbmVy
aWMgaW50ZXJmYWNlIHRvIGV4cG9zZSBzdWNoIGNvdW50ZXJzIHdlIGNhbiBnZXQgcmlkIG9mIHRo
ZQo+IG9sZCBvbmUuCgpUaGFuayB5b3UgOikKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
