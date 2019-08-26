Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A69419CC50
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 11:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9A96E218;
	Mon, 26 Aug 2019 09:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2480C6E218
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 09:12:24 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 82BED5C94AA1F83AECE6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 17:12:22 +0800 (CST)
Received: from [127.0.0.1] (10.57.77.74) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 26 Aug 2019
 17:12:18 +0800
From: xinliang <z.liuxinliang@hisilicon.com>
Subject: [PULL] drm-hisilicon-hibmc-next-2019-08-26
To: <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Message-ID: <5D63A271.7080400@hisilicon.com>
Date: Mon, 26 Aug 2019 17:12:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
X-Originating-IP: [10.57.77.74]
X-CFilter-Loop: Reflected
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSBhbmQgRGFuaWVsLAoKVGhyZWUgc21hbGwgY2xlYW51cCBhbmQgZml4IHBhdGNoZXMg
Zm9yIDUuNCBoaXNpbGljb24gaGlibWMgZHJpdmVyLgpJIGhhdmUgdGVzdGVkIGFuZCB2ZXJpZmll
ZCBvbiB0YWlzaGFuIDIyODB2MS92MiBtYWNoaW5lcy4KCkFzIG15IGRybS1taXNjIHNzaCBhY2Nv
dW50IHJlcXVlc3RbMV0gaXMgbm90IGZpbmlzaCB5ZXQsIEkgc3RpbGwgc2VuZCAKdGhlIHB1bGwg
dGhpcyB0aW1lLgpQbGVhc2UgcHVsbCwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9mcmVlZGVza3RvcC9mcmVlZGVza3RvcC9pc3N1ZXMvMTgzCgpCZXN0LApYaW5s
aWFuZwoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMzQwNDRjZDI5NTViNTRm
YjkxNDFiZTMxZDEyNTAwYmI1ODlhYTZjODoKCiAgIE1lcmdlIGJyYW5jaCAnbGludXgtNS40JyBv
ZiBnaXQ6Ly9naXRodWIuY29tL3NrZWdnc2IvbGludXggaW50byAKZHJtLW5leHQgKDIwMTktMDgt
MjMgMTM6MjM6NDMgKzEwMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoKCiAgIGh0dHBzOi8vZ2l0aHViLmNvbS94aW4zbGlhbmcvbGludXguZ2l0IAp0YWdzL2RybS1o
aXNpbGljb24taGlibWMtbmV4dC0yMDE5LTA4LTI2Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gZmVlYjA3ZDBjYTVhZDBkNmVkYjViYjcyOGUzM2UyZTg2MTE4NTI5ZDoKCiAgIGRybS9o
aXNpbGljb24vaGlibWM6IE1ha2UgQ09ORklHX0RSTV9ISVNJX0hJQk1DIGRlcGVuZCBvbiBBUk02
NCAKKDIwMTktMDgtMjYgMTU6MjE6MzQgKzA4MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNodWhvbmcgWXVhbiAoMSk6
CiAgICAgICBkcm0vaGlzaWxpY29uOiBVc2UgZGV2X2dldF9kcnZkYXRhCgpNYXR0aGV3IFJ1ZmZl
bGwgKDEpOgogICAgICAgZHJtL2hpc2lsaWNvbi9oaWJtYzogTWFrZSBDT05GSUdfRFJNX0hJU0lf
SElCTUMgZGVwZW5kIG9uIEFSTTY0CgpZdWVIYWliaW5nICgxKToKICAgICAgIGRybS9oaXNpbGlj
b24vaGlibWM6IFVzaW5nIG1vZHVsZV9wY2lfZHJpdmVyLgoKICBkcml2ZXJzL2dwdS9kcm0vaGlz
aWxpY29uL2hpYm1jL0tjb25maWcgICAgICAgICB8ICAyICstCiAgZHJpdmVycy9ncHUvZHJtL2hp
c2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgfCAxOSArKystLS0tLS0tLS0tLS0tLS0tCiAg
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
