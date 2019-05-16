Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 492AB214F2
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0384F898C7;
	Fri, 17 May 2019 07:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rosenzweig.io (rosenzweig.io [107.170.207.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32A689760
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 15:36:28 +0000 (UTC)
Received: by rosenzweig.io (Postfix, from userid 1000)
 id 091D860AC9; Thu, 16 May 2019 08:36:28 -0700 (PDT)
Date: Thu, 16 May 2019 08:36:27 -0700
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 0/3] drm/panfrost: drm_gem_map_offset() helper
Message-ID: <20190516153627.GA22778@rosenzweig.io>
References: <20190516141447.46839-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516141447.46839-1-steven.price@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 17 May 2019 07:54:52 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvdmlkaW5nIG1haW50YWluZXJzIG1vcmUgYXdhcmUgb2YgdGhlIHN1YnN0YW5jZSByZXZpZXcg
aXQgYW5kIG9rIGl0LApwYXRjaGVzIDEtMiBhcmU6CgoJQWNrZWQtYnk6IEFseXNzYSBSb3Nlbnp3
ZWlnIDxhbHlzc2FAcm9zZW56d2VpZy5pbz4KClBhdGNoIDMgc2hvdWxkIGJlOgoKCVJldmlld2Vk
LWJ5OiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhQHJvc2VuendlaWcuaW8+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
