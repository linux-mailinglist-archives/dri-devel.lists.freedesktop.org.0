Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C53DEFAD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 16:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F4C6E111;
	Mon, 21 Oct 2019 14:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E811A6E111
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:34:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p4so14273082wrm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=op0Fm5qRWoebHt7vgXu8fI5ezBgXMcotXParKTZ7ztA=;
 b=HvIyMU1KFaaorw011TzJPntPXJFCtbGS0nP9ZlTorKdskZnu00ZvOwmLERt0bYYRx9
 XPxk8EjVvOrVXEX7hI/ANjYY9pObl3H6QRmI6NDNgCKtORYsncvwLsud1PNbIME5nzhW
 niETyKytXC0nyBG3tq1GdShH+2WA2Rrgdk/sE8La75QiE9V5LRgyxJJg7m+O8XtNJHhs
 KYSDLUraZ5dSDa8T20MLpyLrud5dnBoA32vz3IB+wi9mGKNM4A+any8iYRAD//Gg05Ax
 039L82r6SuTGG+E3TnuaexGS22nTkfcQ7KLcGb3AMr2rfL5XWOiQeKIAEnsSNOFE82Yt
 zYPQ==
X-Gm-Message-State: APjAAAVF2ziCL6+ZmTL+FrIx1Avh2gezUMkC1GA71jeK1PW3DgfppvFM
 P1UM3I3fKfPyt8hFF5QORHIqCS91
X-Google-Smtp-Source: APXvYqwofj3WqPmwCIt30ZG2IZx4UFfPuf7Rs4nJz5JAUSfrunEvfjN/TAF1qhysYS4MpQ8Qq5xNXg==
X-Received: by 2002:a05:6000:11cd:: with SMTP id
 i13mr19461330wrx.197.1571668486189; 
 Mon, 21 Oct 2019 07:34:46 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id 200sm4710350wme.32.2019.10.21.07.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:34:44 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/13] drm/dp: Remove a gratuituous blank line
Date: Mon, 21 Oct 2019 16:34:26 +0200
Message-Id: <20191021143437.1477719-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021143437.1477719-1-thierry.reding@gmail.com>
References: <20191021143437.1477719-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=op0Fm5qRWoebHt7vgXu8fI5ezBgXMcotXParKTZ7ztA=;
 b=hYStQrimxzno4LaI9vndM8Y9V/3HIA22aDdIqpIyeAcglfsMG6WjPmVcvU8ovRbFew
 VvgK5+DA0v/5RM3SWlv9y8M4AT3rJlhgpRiLYqSKUxHx6j+E0yivUGaiqdY8iv/q3nSu
 rfBQ76s1aSBACJWxwsPHpLJWO9joW5laJ+M63I/iH0mIB7EESy1qbUebYbnCOrMw8cA2
 nLhWntQ/mplqZUMQin37LCTK7jlSTT22TBhtn8h3jG7IBk32o73S28Qg7CO13bEkTzoD
 XNIN+KvuzqbwRubcYc89eKu3sBUIPC4PdPrttxV9KLUK96F/FwSkvRpjURSHhKWXiJZ8
 X1VQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkl0J3MgaWRpb21hdGlj
IHRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgb2YgYSBmdW5jdGlvbiBjYWxsIGltbWVkaWF0ZWx5
CmFmdGVyIHRoZSBmdW5jdGlvbiBjYWxsLCB3aXRob3V0IGFueSBibGFuayBsaW5lcyBpbiBiZXR3
ZWVuLCB0byBtYWtlIGl0Cm1vcmUgb2J2aW91cyB0aGF0IHRoZSB0d28gbGluZXMgYmVsb25nIHRv
Z2V0aGVyLgoKUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClNpZ25l
ZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwppbmRleCBmMzczNzk4ZDgyZjYuLjhmMmQ3YzQ4
NTBjYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCkBAIC0yMjAsNyArMjIwLDYgQEAgc3RhdGlj
IGludCBkcm1fZHBfZHBjZF9hY2Nlc3Moc3RydWN0IGRybV9kcF9hdXggKmF1eCwgdTggcmVxdWVz
dCwKIAkJfQogCiAJCXJldCA9IGF1eC0+dHJhbnNmZXIoYXV4LCAmbXNnKTsKLQogCQlpZiAocmV0
ID49IDApIHsKIAkJCW5hdGl2ZV9yZXBseSA9IG1zZy5yZXBseSAmIERQX0FVWF9OQVRJVkVfUkVQ
TFlfTUFTSzsKIAkJCWlmIChuYXRpdmVfcmVwbHkgPT0gRFBfQVVYX05BVElWRV9SRVBMWV9BQ0sp
IHsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
