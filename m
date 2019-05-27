Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F47C2CD5B
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB00A6E286;
	Tue, 28 May 2019 17:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn
 [202.108.3.165])
 by gabe.freedesktop.org (Postfix) with SMTP id 806F889A94
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 14:22:35 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([123.112.52.157])
 by sina.com with ESMTP
 id 5CEBF283000016EA; Mon, 27 May 2019 22:21:57 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 281274399391
From: Hillf Danton <hdanton@sina.com>
To: christian.koenig@amd.com,
	ckoenig.leichtzumerken@gmail.com
Subject: Re: [PATCH 02/12] dma-buf: add dma_buf_(un)map_attachment_locked
 variants v3
Date: Mon, 27 May 2019 22:21:48 +0800
Message-Id: <20190527142148.14640-1-hdanton@sina.com>
MIME-Version: 1.0
Thread-Topic: Re: [PATCH 02/12] dma-buf: add dma_buf_(un)map_attachment_locked
 variants v3
X-Mailman-Approved-At: Tue, 28 May 2019 17:13:51 +0000
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIE1vbiwgMjcgTWF5IDIwMTkgMTg6NTY6MjAgKzA4MDAgQ2hyaXN0aWFuIEtvZW5pZyB3cm90
ZToKPiBUaGFua3MgZm9yIHRoZSBjb21tZW50cywgYnV0IHlvdSBhcmUgbG9va2luZyBhdCBhIGNv
bXBsZXRlbHkgb3V0ZGF0ZWQgcGF0Y2hzZXQuCj4gCj4gSWYgeW91IGFyZSBpbnRlcmVzdGVkIGlu
IHRoZSBuZXdlc3Qgb25lIHBsZWFzZSBwaW5nIG1lIGFuZCBJJ20gZ29pbmcgdG8gQ0MgeW91Cj4g
d2hlbiBJIHNlbmQgb3V0IHRoZSBuZXh0IHZlcnNpb24uCj4gClBpbmcuLi4KClRoYW5rcwpIaWxs
ZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
