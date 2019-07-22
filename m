Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B579A7125F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290C288DD0;
	Tue, 23 Jul 2019 07:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rosenzweig.io (rosenzweig.io [107.170.207.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81744896E5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 14:15:36 +0000 (UTC)
Received: by rosenzweig.io (Postfix, from userid 1000)
 id 366F86000E; Mon, 22 Jul 2019 07:15:36 -0700 (PDT)
Date: Mon, 22 Jul 2019 07:15:36 -0700
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/5] drm/panfrost: Add support for GPU heap allocations
Message-ID: <20190722141536.GF2156@rosenzweig.io>
References: <20190717183352.22519-1-robh@kernel.org>
 <20190717183352.22519-4-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190717183352.22519-4-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAgI2RlZmluZSBQQU5GUk9TVF9CT19OT0VYRUMJMQo+ICsjZGVmaW5lIFBBTkZST1NUX0JPX0hF
QVAJMgoKQmlrZXNoZWRkaW5nLCBidXQgSSBkb24ndCBsaWtlIHRoaXMgbmFtZS4gVGhlcmUgYXJl
LCBJIHRoaW5rLCBtdWx0aXBsZQpHUFUtbWFwcGVkIGJ1ZmZlcnMgKGF0IGxlYXN0IGluIFBhbmZy
b3N0IC0tIEkgZG9uJ3Qga25vdyBob3cgdGhlIGJsb2IKbWFuYWdlcyBtZW1vcnkpIHRoYXQgY2Fu
IGJlIGNvbnNpZGVyZWQgaGVhcHMgb2Ygc29ydHMuIFNvbWUgb2YgdGhvc2UgYXJlCmp1c3QgcmVn
dWxhciBvbGQgQk9zLgoKV2hhdCBtYWtlcyB0aGVzZSBzcGVjaWFsIGlzIHRoYXQgdGhleSdyZSBn
cm93YWJsZS4gQ2FsbGluZyBpdCAiaGVhcCIgaXMKb2theSBpbnNpZGUgdGhlIGtlcm5lbCwgYnV0
IGZvciB0aGUgVUFCSSwgSSdkIHByZWZlciBhbiBleHBsaWNpdAoiUEFORlJPU1RfQk9fR1JPV0FC
TEUoX0hFQVApIiB0byBtYWtlIGl0IG9idmlvdXMgd2hhdCdzIGdvaW5nIG9uLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
