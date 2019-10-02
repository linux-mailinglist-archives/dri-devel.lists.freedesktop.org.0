Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665D8CB52F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CDE6EAB3;
	Fri,  4 Oct 2019 07:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F43F6E22A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 15:44:28 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26vB-1iIAky2d21-002ZYR; Wed, 02
 Oct 2019 17:38:57 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/mcde: Fix Sphinx formatting
Date: Wed,  2 Oct 2019 17:38:27 +0200
Message-Id: <20191002153827.23026-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191002153827.23026-1-j.neuschaefer@gmx.net>
References: <20191002153827.23026-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:+HGwyEkEJ1bTWVKUnQD498SQcfuBEXN7W3Cj2BGlplSjTF4nz8f
 cBUw6lk5d0t6dvZbTJEE0d3SOQTGqREpxLdnWvFCAT0RVu51e1dc03+JVBM+f6FILbK5lqA
 8DIH19MLF2K5FCSv83/YTi+Y5kG5g9G+P/NYzqFHgNz8SSVUzP4Yh9CPwzyyIpWRJQRi8kz
 pkHWoe2H4jisRK4hILzvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P7aLgw4I/rw=:mh/pAqQkrjKzWjJ/RhoYW9
 hzQ5O7foVQ12bORWb2hzBbQqDSZm9yh0jEY9564F4A0D60xqKxzdNEV7mQUyFOepLzaQ3SXlq
 Yb6fG2lFyLNl/ShJqISn//Q72AhNr9+Dn+QzQPb+fEfla2OYflRJuQcxyLIzFa3WXqeNzVIvm
 Tg6Bx8q8xTX2kTEWsyOryO2wQre+VqIeMiy6FldOHcf5XlC7dF2PF6qWKGFGja7XjGNZEBH+B
 I0cmb39o7EeIK6qejLtnRnsJdM0SZ8rliFh+j0RJmnbK9aHqwOlJbQg2fs+1/uPe3Kkq6wdnM
 HDtrvG+WcRc/Zbq7+GondCIJThwXsNw4KhYjcmqA68aiYtt7LjG8j9qjYhD6IKHnpd2Ep++9y
 lVlxdidGDfKmyphJ9G67ISchTB2GJQkPDWVf3lOWFHTTi8kIeVCs8yNgTCgDGy0qghr8feLBg
 SzpchABd63nemokjqSGR9WscXFaNo6dyaMAqTkzGNR2mJErKIL21UIxd87vHpZ06L7PCiuL7u
 jkfwtL3jnhDFpyPvVF+4Vbej65b8NjKxtTfigst5MoDErtYdb4VTQlu0dAhj0Gd9DMKfsJ3+h
 fdw2naMfycHLbnv2fWqlS8GFTMbwifx/Zza4L0z/y8xc+XLk5hx0Fuanq+TKAwO5qTkOX0B8i
 NT35JVvB0oZ1VhSxSiN/VXiaKU5jlRP7wuF81+mBOU2csvcTnFmAEFegjPEP2deZ6p809U/7a
 zoXoM0jY5UR8wJlwk2mWps83U9OCyTMIg0EsTetNOD+xDYSMtxblntkfI6HFTO9ceLiaFJ+ME
 3wQDkATKSjQLdQyAfMKOdH+RM7xIS5PPW0dF3HVvGb751NL45zGRqKpsN+k9ZVPH8XDf49dgj
 LNx4TxQjb8q6YOCN153Q1DFvsBr/MSEZH1WUf6Eh2taELSguQRA3diJCrLX9TRy72XAg0LFJ0
 wvJtLWEzENtshfiD51rElVEKbE0DZFoHBbJ6amlCsIke5zaX2/qxYnm9D6wj6R5lMkKEUSs7t
 6BxzxV5fM38rRHPbsqg8BL+EuTuaS3Ywh3WgcpFRq1VyRltfHCtDoGNawyxuZUtwGZqIG7FiH
 bFDGavKAmicLW8pJzDu7vF5IQgX+AdhAmreLw/1rtY0PpHuKTAKb+DUjQ+q8tnO534rW7/v+D
 zYClPLErkd86Ac/qEvW3InZRXRfBiqKpuHnxVsqJ/FEM/pb6npyYB2O3hmMDn9rIbHsSzYosU
 GNSeShsi44QqV3W1ZgdVgQi8rxet0M97iEGiG82SB/TNCWUx2nJ2yvIMNviA=
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1570031065;
 bh=7UNQa6APdXCQXKmz4/u06gNevWXgMiwFA0a8UcA0ctY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=b03uUm2slfvhZ5J3xQaB6+DhcHMUzGIw0EoNiFJPa5z2WkNhGKt3jivMYcyOTFQKU
 GPL4idn7sYSLWeGtbO/VprAua8NFj0i8F1kRjl+5C46tvec0BQ8NcSRpYKfx1Kn5kY
 qtI5HdkEa6eJMkCP/4b7Nmitd0J7d2hYYOln6LUU=
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LSBGb3JtYXQgdGhlIHBpcGUgZGlhZ3JhbSBhcyBhIG1vbm9zcGFjZSBibG9jay4KLSBGaXggZm9y
bWF0dGluZyBvZiB0aGUgbGlzdC4gV2l0aG91dCB0aGUgZW1wdHkgbGluZSwgdGhlIGZpcnN0IGRh
c2ggaXMKICBub3QgcGFyc2VkIGFzIGEgYnVsbGV0IHBvaW50LgoKU2lnbmVkLW9mZi1ieTogSm9u
YXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbWNkZS9tY2RlX2Rydi5jIHwgOSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21jZGUvbWNkZV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHJ2LmMKaW5kZXgg
OWEwOWViYTUzMTgyLi5jNTM1YWJlZDQ3NjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
Y2RlL21jZGVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYwpAQCAt
MjAsMTEgKzIwLDExIEBACiAgKiBpbnB1dCBmb3JtYXRzIGluY2x1ZGluZyBtb3N0IHZhcmlhbnRz
IG9mIFJHQiBhbmQgWVVWLgogICoKICAqIFRoZSBoYXJkd2FyZSBoYXMgZm91ciBkaXNwbGF5IHBp
cGVzLCBhbmQgdGhlIGxheW91dCBpcyBhIGxpdHRsZQotICogYml0IGxpa2UgdGhpczoKKyAqIGJp
dCBsaWtlIHRoaXM6OgogICoKLSAqIE1lbW9yeSAgICAgLT4gT3ZlcmxheSAtPiBDaGFubmVsIC0+
IEZJRk8gLT4gNSBmb3JtYXR0ZXJzIC0+IERTSS9EUEkKLSAqIEV4dGVybmFsICAgICAgMC4uNSAg
ICAgICAwLi4zICAgICAgIEEsQiwgICAgMyB4IERTSSAgICAgICAgIGJyaWRnZQotICogc291cmNl
IDAuLjkgICAgICAgICAgICAgICAgICAgICAgICAgQzAsQzEgICAyIHggRFBJCisgKiAgIE1lbW9y
eSAgICAgLT4gT3ZlcmxheSAtPiBDaGFubmVsIC0+IEZJRk8gLT4gNSBmb3JtYXR0ZXJzIC0+IERT
SS9EUEkKKyAqICAgRXh0ZXJuYWwgICAgICAwLi41ICAgICAgIDAuLjMgICAgICAgQSxCLCAgICAz
IHggRFNJICAgICAgICAgYnJpZGdlCisgKiAgIHNvdXJjZSAwLi45ICAgICAgICAgICAgICAgICAg
ICAgICAgIEMwLEMxICAgMiB4IERQSQogICoKICAqIEZJRk9zIEEgYW5kIEIgYXJlIGZvciBMQ0Qg
YW5kIEhETUkgd2hpbGUgRklGTyBDTy9DMSBhcmUgZm9yCiAgKiBwYW5lbHMgd2l0aCBlbWJlZGRl
ZCBidWZmZXIuCkBAIC00Myw2ICs0Myw3IEBACiAgKiB0byBjaGFuZ2UgYXMgd2UgZXhwbG9pdCBt
b3JlIG9mIHRoZSBoYXJkd2FyZSBjYXBhYmlsaXRpZXMuCiAgKgogICogVE9ETzoKKyAqCiAgKiAt
IEVuYWJsZWQgZGFtYWdlZCByZWN0YW5nbGVzIHVzaW5nIGRybV9wbGFuZV9lbmFibGVfZmJfZGFt
YWdlX2NsaXBzKCkKICAqICAgc28gd2UgY2FuIHNlbGVjdGl2ZWx5IGp1c3QgdHJhbnNtaXQgdGhl
IGRhbWFnZWQgYXJlYSB0byBhCiAgKiAgIGNvbW1hbmQtb25seSBkaXNwbGF5LgotLQoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
