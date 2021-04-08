Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CAD358117
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 12:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C115F6E160;
	Thu,  8 Apr 2021 10:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F206E160
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 10:49:27 +0000 (UTC)
Date: Thu, 08 Apr 2021 10:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1617878965;
 bh=4KyT1/E69WFcS04Mp+ZbN8XnLf1Q4KjsPxJ8CbnpIvM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Ha0m+WdS5yC9urJ3rKQ61Wlm4dqZfFexoWWjcz9eFV3IaGjmJQ6vq1WczVqWHAbvn
 Y7wueOASjAFXj7DtGEL4sgv9j3zZkcnSwlMKFAtKz1DqgbdQppBHiRmpniClDhn++4
 JiEY5kPCP/auyoHVOSwyc/SRuWXjceR60eKyzO1vkfLwXopJwzHrjdGjh02yfMXFQ/
 pwe1ILMzMFLb3ATkJBHWcltulHE2WVs0h/raETcANcwVGZWqQbl/WxJ81whHEc9lvj
 KOQCCs7h8DBIyCKj95xK1rWZLQ993jVeHYnXxf5KyWYCzA/RdADZpa2GJ5/kAy1CTt
 4/VNskcmXXhiA==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] drm: Fix 3 typos in the inline doc
Message-ID: <hOnwsZU9AW3Xnixi56ZMlHqp4JtfTqj9kHfbyK6u1yaBKn4E_aQjpLYkWy8Y4Elc4j-lVqvr7l4nnx7RN6yJsqW24IZT13ltscEPncza8yY=@emersion.fr>
In-Reply-To: <YG7faWxOnsWyFJYQ@phenom.ffwll.local>
References: <20210326103216.7918-1-dafna.hirschfeld@collabora.com>
 <BfA-piXji9BZRHnRUxveUb-SF8mAW5piyHW8fZT5o2xy0g-z21gO2Gyu2Iw5pUX7v2K1NpELuornJXEFtH8kBPhDfJFyWsyee4rol2suPZs=@emersion.fr>
 <YG7faWxOnsWyFJYQ@phenom.ffwll.local>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, airlied@linux.ie,
 dafna3@gmail.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, tzimmermann@suse.de,
 enric.balletbo@collabora.com, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ah, I haven't seen the second patch...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
