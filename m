Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0C7E7B7E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 11:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8166C10E95C;
	Fri, 10 Nov 2023 10:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3474E10E95C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 10:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699613320; x=1699872520;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ZxkPzHWLIhK5UyeV1jeoueAYEj83QUfni2dYgKzMVxl/+rx5139gCAEVjlsAX4vLo
 1rNSuWW/A+snyoddCXON+NUiDq9uK2ANNLLg7XDfQru69eBZNNjLbhWvE/GQ75qPv5
 XpeV3kEbQlj+iNMob/5C9RbQ1TNTAk3Og/u9A5UXSuLdTADw8pi1UbTISSP3cT9aGQ
 n6fiMEcGKUjQkyhAZQcPl0h9v8cE3DssfIcg3hb14clklIiK02nNBt+vaMc+29GgS8
 7MNpcUP4x0sC+hVA+3Q7SXqt+znX/CZcbnX5f7WQ9F748+JiQTSfIgF+/QLLhrrOQQ
 0qXwM3rBJuvWQ==
Date: Fri, 10 Nov 2023 10:48:24 +0000
To: Javier Martinez Canillas <javierm@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 5/6] drm/plane: Extend damage tracking kernel-doc
Message-ID: <qdMlBGv4FDrkh7ReBUjr0bIxtX7XsICq9YWIMn3tCE2ThkUCKzOr13_KTvWjCYniBGffjq4wXtTkGwc_mFVWDykIFKvsNO6Y7aXUdyNdcIY=@emersion.fr>
In-Reply-To: <20231109172449.1599262-6-javierm@redhat.com>
References: <20231109172449.1599262-1-javierm@redhat.com>
 <20231109172449.1599262-6-javierm@redhat.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sima Vetter <daniel.vetter@ffwll.ch>,
 Bilal Elmoussaoui <belmouss@redhat.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
