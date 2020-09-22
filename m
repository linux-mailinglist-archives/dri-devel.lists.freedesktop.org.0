Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FAA27480E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 20:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110E76E8D5;
	Tue, 22 Sep 2020 18:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83376E8D5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 18:22:04 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 844492C0;
 Tue, 22 Sep 2020 18:22:02 +0000 (UTC)
Date: Tue, 22 Sep 2020 12:22:00 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 0/3] Fix Kernel-doc warnings introduced on next-20200921
Message-ID: <20200922122200.149d8e96@lwn.net>
In-Reply-To: <20200922175206.GY6112@intel.com>
References: <cover.1600773619.git.mchehab+huawei@kernel.org>
 <a2c0d1ac02fb4bef142196d837323bcde41e9427.camel@redhat.com>
 <20200922175206.GY6112@intel.com>
Organization: LWN.net
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, netdev@vger.kernel.org,
 Francesco Ruggeri <fruggeri@arista.com>, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, David Airlie <airlied@linux.ie>,
 Eric Dumazet <edumazet@google.com>, Jiri Pirko <jiri@mellanox.com>,
 dri-devel@lists.freedesktop.org, Jakub Kicinski <kuba@kernel.org>,
 Cong Wang <xiyou.wangcong@gmail.com>, Andrii Nakryiko <andriin@fb.com>,
 "David S. Miller" <davem@davemloft.net>, Taehee Yoo <ap420073@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMiBTZXAgMjAyMCAyMDo1MjowNiArMDMwMApWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gTWVhIGN1bHBhLiBNeSBkb2MgdGVz
dCBidWlsZCB3YXMgZm9pbGVkIGJ5IHRoZSBzcGhpbnggMiB2cy4gMwo+IHJlZ3Jlc3Npb24gYW5k
IEkgd2FzIHRvbyBsYXp5IHRvIHN0YXJ0IGRvd25ncmFkaW5nIHRoaW5ncy4KPiBBbnkgRVRBIGZv
ciBnZXR0aW5nIHRoYXQgZml4ZWQgYnR3PwoKVGhlcmUncyBhIGZpeCBvZiBzb3J0cyBpbiBkb2Nz
LW5leHQgKGFuZCB0aHVzIGxpbnV4LW5leHQpIG5vdywgaGFzIGJlZW4KdGhlcmUgZm9yIGEgZmV3
IHdlZWtzLiAgUmVhbGx5IGZpeGluZyB0aGF0IHByb2JsZW0gcHJvcGVybHkgcmVxdWlyZXMgbW9y
ZQp0aW1lIHRoYW4gYW55Ym9keSBzZWVtcyB0byBoYXZlIGF0IHRoZSBtb21lbnQuCgpqb24KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
