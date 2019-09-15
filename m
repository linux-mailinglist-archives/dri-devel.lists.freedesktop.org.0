Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819D4B3591
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18F16E851;
	Mon, 16 Sep 2019 07:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn
 [202.108.3.167])
 by gabe.freedesktop.org (Postfix) with SMTP id 65DF86F586
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 03:40:27 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([222.131.67.234])
 by sina.com with ESMTP
 id 5D7DB16300012D07; Sun, 15 Sep 2019 11:35:01 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 427606629758
From: Hillf Danton <hdanton@sina.com>
To: Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: [RFC PATCH 0/7] Emulated coherent graphics memory take 2
Date: Sun, 15 Sep 2019 11:34:50 +0800
Message-Id: <20190915033450.14008-1-hdanton@sina.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:04 +0000
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
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIEZyaSwgMTMgU2VwIDIwMTkgMTE6MzI6MDYgKzAyMDAKPiAKPiBUaGUgbW0gcGF0Y2ggcGFn
ZSB3YWxrIGludGVyZmFjZSBoYXMgYmVlbiByZXdvcmtlZCB0byBiZSBzaW1pbGFyIHRvIHRoZQo+
IHJld29ya2VkIHBhZ2Utd2FsayBjb2RlIChtbS9wYWdld2Fsay5jKS4gVGhlcmUgaGF2ZSBiZWVu
IHR3byBvdGhlciBzb2x1dGlvbnMKPiB0byBjb25zaWRlcjoKPiAxKSBVc2luZyB0aGUgcGFnZS13
YWxrIGNvZGUuIFRoYXQgaXMgY3VycmVudGx5IG5vdCBwb3NzaWJsZSBzaW5jZSBpdCByZXF1aXJl
cwo+IHRoZSBtbWFwLXNlbSB0byBiZSBoZWxkIGZvciB0aGUgc3RydWN0IHZtX2FyZWFfc3RydWN0
IHZtX2ZsYWdzIGFuZCBmb3IgaHVnZQo+IHBhZ2Ugc3BsaXR0aW5nLiBUaGUgcGFnZXdhbGsgY29k
ZSBpbiB0aGlzIHBhdGNoc2V0IGNhbid0IGhvbGQgdGhlIG1tYXAgc2Vtcwo+IHNpbmNlIGl0IHdp
bGwgbGVhZCB0byBsb2NraW5nIGludmVyc2lvbi4KClNwZWNpZnkgdGhlIGxvY2tpbmcgc2NlbmFy
aW8sIGlmIG5vbi1yZmMgaXMgcGxhbm5lZCwgdG8gaGVscCB1bmRlcnN0YW5kCnRoZSBuZXcgd2hl
ZWwgdGhpcyBwYXRjaHNldCBsb29rcyB0byBjcmVhdGUsIGFzIHR3byBkYXlzIG9mIGZpbmRpbmcg
aXQgaW4KdGhlIHdvcmtzIGFmdGVyIGJhNGU3ZDk3M2RkMCBmYWlsZWQuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
