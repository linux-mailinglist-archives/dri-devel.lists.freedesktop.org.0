Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A89A76E5CE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 12:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0B610E079;
	Thu,  3 Aug 2023 10:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3651210E079
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 10:36:00 +0000 (UTC)
Date: Thu, 03 Aug 2023 10:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1691058958; x=1691318158;
 bh=p2Oc75brb0upA/SOS0qRqoycApL8jSmQswfZKqViQrg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=WufluoeIAbIWTuSflOL25mRRJrzltJnE+Wbor4iZhJkaB+vW8o3CE9yzvN3tC7fT2
 Kz9E8aYrVI/1f5tVmhMcuxeh4XpqER1JTdCt+oqdKcVeM1SNvZ3Q5buHHheKEvMUdY
 uKITdbNMhKu/nHEXlOJARIsSfj3IVsvex6jaZeYxLYG9qCIOW6Bw+qIOjaa7c1VzN0
 8zo8Uizdk686AgblodfG1P9FXCunCEyLEtYSFQse2RJeQJCKE/JhCK122TIGnJY3k/
 HacCIHEu8m08AgqhIdjogl0O7fYOLxj2yF9T27xOC4qI/poFaQZm4uqViZRIMu2AX+
 dYafAdpVSIPwA==
To: Jani Nikula <jani.nikula@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: use proper cross-references for sections
Message-ID: <P6JbmMFsqu9R22HtfS2iOB7T7CM3itUC_bAjV_QYZfeR8hwbGTqfDs9CHzQve160_gW2uEs7hmTvI3WLINCCXQfbZaze1616osw8cgNQnVs=@emersion.fr>
In-Reply-To: <878rasv3qs.fsf@intel.com>
References: <20230803095734.386761-1-contact@emersion.fr>
 <878rasv3qs.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, August 3rd, 2023 at 12:07, Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:

> > DRM Sync Objects
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
> Care to fix that title underline too, in a separate patch, please?

Sure, submitted!

> This one's
>=20
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thank you!
