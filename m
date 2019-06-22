Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DF84F4D1
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 11:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF28B6E963;
	Sat, 22 Jun 2019 09:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB546E963
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 09:42:31 +0000 (UTC)
Date: Sat, 22 Jun 2019 09:42:23 +0000
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: KMS documentation for userspace
Message-ID: <CLDOTegW4ppx_UNVBkWEPwtQRm_FyMR8CfTXADZYMh6A11C7wZuK4OdCpelWTVtJtxOH3VkLkXqtd7E4LqBPqpKB_7rYH8wq0xpKpmYUkZY=@emersion.fr>
In-Reply-To: <CAKMK7uH7Twme7kn==ZXeCuC5+uL0RAm9fv2KJui=KATZwLHuqw@mail.gmail.com>
References: <13b7wY-2xuVr-7VBZKIUaV5hr_T03akw4sBL_zlsLRxksg5UZGpAYRKSq8_VmBRAvODmSISqGda2YU332G9O9IaJluDJFsc6R8uWkQeQT1o=@emersion.fr>
 <CAKMK7uH7Twme7kn==ZXeCuC5+uL0RAm9fv2KJui=KATZwLHuqw@mail.gmail.com>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emersion.fr; s=protonmail; t=1561196549;
 bh=3dZRzlEK3kas0OqHDU1UxtNFK/wkSbP9usbWX/vW424=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=wLWE75Cs+ppT1UlDTGGH70Ys2JfntYKRKro0+59yETccZZOwaOAJQNe5totRj/Z04
 GEo1MT5kBI3MW/PiSistbjnY0e9YJZBvcndP1rXHasaq1fxvlXBYj/e6AjO6voT6K6
 gdlJNMNL4HGA8Uz0ftYs5s0yWo4Y4JfaGzMG9PkI=
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5LCBKdW5lIDE5LCAyMDE5IDEwOjUzIFBNLCBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+IHdyb3RlOgo+IHRsZHI7IFllcywgSSBqdXN0IGRpZG4ndCBnZXQgYXJvdW5k
IHRvIGl0IHlldC4KPgo+IFRoZSByb3VnaCBwbGFuIGlzIHRvIGFjdHVhbGx5IGRvY3VtZW50IGlv
Y3RscyBhbmQgcHJvcGVydGllcyBhbmQgYWxsCj4gdGhhdCBzdHVmZiBpbiBkcm0tdWFwaS5yc3Qs
IGFuZCB0aGVuIGNyb3NzLWxpbmsgdGhhdCB3aXRoIHRoZQo+IGRyaXZlci1zaWRlIGRvY3VtZW50
YXRpb24uCgpJJ20gY29uZnVzZWQgcmVnYXJkaW5nIGRybS11YXBpLnJzdCdzIHJvbGUuIElzIGl0
IGEgZG9jdW1lbnQgZm9yIGtlcm5lbCBkcml2ZXIKd3JpdGVycyB0byBleHBhbmQgdGhlIHVBUEks
IG9yIGlzIGl0IGEgZG9jdW1lbnQgZm9yIHVzZXJzcGFjZT8KCkl0J3MgY3VycmVudGx5IGZpbGxl
ZCB3aXRoIHJlZmVyZW5jZXMgdG8gaW50ZXJuYWwga2VybmVsIHN5bWJvbHMKKGRybV9tYXN0ZXJf
Z2V0LCBkcm1faW9jdGxfZGVzYywgZHJtX2lvY3RsX3Blcm1pdCBhbmQgc28gb24pLiBTb21lIGNo
YXB0ZXJzIHNlZW0KZGVkaWNhdGVkIHRvIGtlcm5lbCBkZXZzIChlLmcuICJUZXN0aW5nIGFuZCB2
YWxpZGF0aW9uIikuCgpJcyBpdCByZWFsbHkgdGhlIHJpZ2h0IHBsYWNlIGZvciB1c2Vyc3BhY2Ug
ZGV2cyB0byBsZWFybiBob3cgdG8gdXNlIEtNUz8KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
