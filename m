Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB6EC90DD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 20:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B9A6E172;
	Wed,  2 Oct 2019 18:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E835E6E172
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 18:30:15 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 92514807B3;
 Wed,  2 Oct 2019 20:30:12 +0200 (CEST)
Date: Wed, 2 Oct 2019 20:30:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH] drm: Fix comment doc for format_modifiers
Message-ID: <20191002183011.GA29177@ravnborg.org>
References: <20191002154349.26895-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002154349.26895-1-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=-ltbIxTN5rU7bLVlyRIA:9 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 kernel@collabora.com, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplagoKQWx3YXlzIGdvb2QgdG8gaGF2ZSBjbGVhciBkb2N1bWVudGF0aW9uLgoKT24g
V2VkLCBPY3QgMDIsIDIwMTkgYXQgMDU6NDM6NDlQTSArMDIwMCwgQW5kcnplaiBQaWV0cmFzaWV3
aWN6IHdyb3RlOgo+IFRvIGh1bWFuIHJlYWRlcnMKPiAKPiAiYXJyYXkgb2Ygc3RydWN0IGRybV9m
b3JtYXQgbW9kaWZpZXJzIiBpcyBhbG1vc3QgaW5kaXN0aW5ndWlzaGFibGUgZnJvbQo+ICJhcnJh
eSBvZiBzdHJ1Y3QgZHJtX2Zvcm1hdF9tb2RpZmllcnMiLCBlc3BlY2lhbGx5IGdpdmVuIHRoYXQK
PiBzdHJ1Y3QgZHJtX2Zvcm1hdF9tb2RpZmllciBkb2VzIGV4aXN0Lgo+IAo+IEFuZCBpbmRlZWQg
dGhlIHBhcmFtZXRlciBwYXNzZXMgYW4gYXJyYXkgb2YgdWludDY0X3QgcmF0aGVyIHRoYW4gYW4g
YXJyYXkKPiBvZiBzdHJ1Y3RzLCBidXQgdGhlIGZpcnN0IHdvcmRzIG9mIHRoZSBjb21tZW50IHN1
Z2dlc3QgdGhhdCBpdCBwYXNzZXMKPiBhbiBhcnJheSBvZiBzdHJ1Y3RzLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYwo+IGlu
ZGV4IGQ2YWQ2MGFiMGQzOC4uZGYwNWQ4YTBkZDYzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fcGxhbmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYwo+IEBA
IC0xNjAsNyArMTYwLDcgQEAgc3RhdGljIGludCBjcmVhdGVfaW5fZm9ybWF0X2Jsb2Ioc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUKPiAgICogQGZ1bmNzOiBj
YWxsYmFja3MgZm9yIHRoZSBuZXcgcGxhbmUKPiAgICogQGZvcm1hdHM6IGFycmF5IG9mIHN1cHBv
cnRlZCBmb3JtYXRzIChEUk1fRk9STUFUXF9cKikKPiAgICogQGZvcm1hdF9jb3VudDogbnVtYmVy
IG9mIGVsZW1lbnRzIGluIEBmb3JtYXRzCj4gLSAqIEBmb3JtYXRfbW9kaWZpZXJzOiBhcnJheSBv
ZiBzdHJ1Y3QgZHJtX2Zvcm1hdCBtb2RpZmllcnMgdGVybWluYXRlZCBieQo+ICsgKiBAZm9ybWF0
X21vZGlmaWVyczogYXJyYXkgb2YgbW9kaWZpZXJzIG9mIHN0cnVjdCBkcm1fZm9ybWF0IHRlcm1p
bmF0ZWQgYnkKPiAgICogICAgICAgICAgICAgICAgICAgIERSTV9GT1JNQVRfTU9EX0lOVkFMSUQK
QGZvcm1hdF9tb2RpZmllcnMgaXMgYW4gYXJyYXkgb2YgRFJNX0ZPUk1BVF8qIHdoaWNoIGFyZSBk
ZWZpbmVkIGFzOgoKI2RlZmluZSBmb3VyY2NfY29kZShhLCBiLCBjLCBkKSAoKF9fdTMyKShhKSB8
ICgoX191MzIpKGIpIDw8IDgpIHwgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
KF9fdTMyKShjKSA8PCAxNikgfCAoKF9fdTMyKShkKSA8PCAyNCkpCgoKQnV0IHRoZSBhcnJheSBp
cyBhIHU2NFtdIGxpa2UgdGhpczoKc3RhdGljIGNvbnN0IHU2NCB0ZWdyYTIwX21vZGlmaWVyc1td
ID0gewogICAgICAgIERSTV9GT1JNQVRfTU9EX0xJTkVBUiwKICAgICAgICBEUk1fRk9STUFUX01P
RF9OVklESUFfVEVHUkFfVElMRUQsCiAgICAgICAgRFJNX0ZPUk1BVF9NT0RfSU5WQUxJRAp9OwoK
U28gdGhpcyBpcyBub3Qgc3RydWN0IGRybV9mb3JtYXQuCgpDYW4geW91IHRyeSB0byBnaXZlIGl0
IGEgc2hvdCBtb3JlPwoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
