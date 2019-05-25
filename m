Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D432B407
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B914C89A9B;
	Mon, 27 May 2019 12:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail7-215.sinamail.sina.com.cn (mail7-215.sinamail.sina.com.cn
 [202.108.7.215])
 by gabe.freedesktop.org (Postfix) with SMTP id 5C8496E135
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 06:49:05 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.253.229.186])
 by sina.com with ESMTP
 id 5CE8E55C000058A8; Sat, 25 May 2019 14:49:03 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 910313394978
From: Hillf Danton <hdanton@sina.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 05/12] dma-buf: add explicit buffer pinning
Date: Sat, 25 May 2019 14:48:53 +0800
Message-Id: <20190416183841.1577-6-christian.koenig@amd.com>
In-Reply-To: <20190416183841.1577-1-christian.koenig@amd.com>
References: <20190416183841.1577-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
Archived-At: <https://lore.kernel.org/lkml/20190416183841.1577-6-christian.koenig@amd.com/>
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

Ck9uIFR1ZSwgMTYgQXByIDIwMTkgMjA6Mzg6MzQgKzAyMDAgQ2hyaXN0aWFuIEvDtm5pZyB3cm90
ZToKPiArCS8qKgo+ICsJICogQHVucGluX2RtYV9idWY6Cj4gKwkgKgo+ICsJICogVGhpcyBpcyBj
YWxsZWQgYnkgZG1hX2J1Zl91bnBpbiBhbmQgbGV0cyB0aGUgZXhwb3J0ZXIga25vdyB0aGF0IGFu
Cj4gKwkgKiBpbXBvcnRlciBkb2Vzbid0IG5lZWQgdG8gdGhlIERNQS1idWYgdG8gc3RheSB3ZXJl
IGl0IGlzIGFueSBtb3JlLgo+ICsJICoKcy9uZWVkIHRvL25lZWQvICBzL3dlcmUvd2hlcmUvCgo+
ICsJICogVGhpcyBpcyBjYWxsZWQgd2l0aCB0aGUgZG1hYnVmLT5yZXN2IG9iamVjdCBsb2NrZWQu
Cj4gKwkgKgo+ICsJICogVGhpcyBjYWxsYmFjayBpcyBvcHRpb25hbC4KPiArCSAqLwo+ICsJdm9p
ZCAoKnVucGluKShzdHJ1Y3QgZG1hX2J1ZiAqKTsKPiArCkJSCkhpbGxmCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
