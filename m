Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A9B3465D1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108A56E8FA;
	Tue, 23 Mar 2021 17:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C866E8FA
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 17:01:28 +0000 (UTC)
Date: Tue, 23 Mar 2021 17:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1616518886;
 bh=Zu3wkdLhe26AHtC8TTS+mq5MvXbs47CJCjLsQFzJONw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=McAKwRj8cPEyQQlRp2l108vI7MZyT7iihfz2ndJB4kXei9Zsld/4nIKqB5p9q550r
 8y4xXGbr+jue43Yq8YSdV4LeaNJun5itaPLDWE7Tf6nWV5JMZtInNIQe0VdUEQcMqB
 syTb8DFpokRlQXJOeXQwt+3wBa4h1CDq8pyaXBApTzJlG2OKRvVhnsjJVz3ydE/arz
 rrgBJW6cT+mqZjcF4v/m04c/RNPT+STe/v9R8kWfFtT57nqvo/ECroDT4V9G7HDgj+
 ObiFcRDSF5vWDsuYrF934Cr6k1eHUeotwWGX2h5xFc81nOHKI4p83FoATl7ysgbuXE
 JsKeWhA9+UN5Q==
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] drm/doc: Add RFC section
Message-ID: <_qgkbhnFRPb-XwdmeoSsVd7rlelflxuh9B-f9G8GLZoFIeXj48RGtUoEjws4RV0kI1jZvvZSGbOIcHhLWmI_RKJzzawOO9OIyJjBkG9lQH8=@emersion.fr>
In-Reply-To: <20210323084453.366863-2-daniel.vetter@ffwll.ch>
References: <20210323084453.366863-1-daniel.vetter@ffwll.ch>
 <20210323084453.366863-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lkZSBub3RlOiBJIGZlZWwgbGlrZSB3ZSBjb3VsZCBoYXZlIGJldHRlciBsaW5lcyBvZiBjb21t
dW5pY2F0aW9uCmJldHdlZW4ga2VybmVsIGRldnMgYW5kIHVzZXItc3BhY2UgZGV2cy4gVGhlIG5l
dyB1QVBJIHJlcXVpcmVtZW50cyBzZWVtCnRvIGJlIGEgaGlnaCBiYXJyaWVyIHRvIGVudHJ5IGZv
ciBrZXJuZWwgZGV2cy4gSG93ZXZlciBzb21ldGltZXMKdXNlci1zcGFjZSBkZXZzIG1pZ2h0IGJl
IGludGVyZXN0ZWQgaW4gaGVscGluZyBvdXQgd2l0aCB0aGUgdXNlci1zcGFjZQpwYXJ04oCmCgpN
YXliZSBpdCB3b3VsZCBiZSBnb29kIHRvIENDIGUuZy4gd2F5bGFuZC1kZXZlbCBmb3IgbmV3IFJG
Q3MsIHNvIHRoYXQKdXNlci1zcGFjZSBkZXZzIGNhbiBqdW1wIGluIGlmIHRoZXkncmUgaW50ZXJl
c3RlZC4gQW5kIGFsc28gcHJvdmlkZQpmZWVkYmFjaywgc2luY2UgbmV3IHVBUEkgaXMgaGFyZCB0
byBzcG90IGluIHRoZSBzZWEgb2YgbWVzc2FnZXMgaW4KZHJpLWRldmVsLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
