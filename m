Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0DF48E1C1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 01:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D26610E127;
	Fri, 14 Jan 2022 00:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Fri, 14 Jan 2022 00:51:01 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D93E10E127
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 00:51:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N8GIg-1mCovS047k-0149GR for <dri-devel@lists.freedesktop.org>; Fri, 14
 Jan 2022 01:45:54 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so4729010wme.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 16:45:53 -0800 (PST)
X-Gm-Message-State: AOAM532YCkQgXPV9oVDRKYPJTw5p2rYhBOPiOfMknWDwGEE+YBSkKhRU
 hqdRbDdcYAAT1YwKgs6CgnFku+p3mIB1+FHjP/4=
X-Google-Smtp-Source: ABdhPJwV4G3A5mpFnAW11HwlY/Tf7y1xRC36rwdQkkqDkkOWfKAxxiuv8Puk8O7tRRiiu1Ah39q+R3OAJUeOa6nnmfM=
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr6081734wmk.98.1642121153661; 
 Thu, 13 Jan 2022 16:45:53 -0800 (PST)
MIME-Version: 1.0
References: <20220113171921.17466-1-philippe.cornu@foss.st.com>
 <20220113171921.17466-2-philippe.cornu@foss.st.com>
In-Reply-To: <20220113171921.17466-2-philippe.cornu@foss.st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 14 Jan 2022 01:45:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Nn3fwEMtb9f0DZhbyY+mLva5XR332XfXqX=WSmB9a8w@mail.gmail.com>
Message-ID: <CAK8P3a0Nn3fwEMtb9f0DZhbyY+mLva5XR332XfXqX=WSmB9a8w@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update Benjamin Gaignard maintainer
 status
To: Philippe Cornu <philippe.cornu@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:h9C3GWa+UG+WmLgVBVjReo3b89S3vdqh7Xd9LgtOuZWlE0kjOxl
 pQt1py7XqMhwkZI9kQkaoClypP/591ycZK3GbOroWRUCGkbY8YIKAI918BnG42jBdSJhKJV
 aoMU+AOl/INEP7SZMHhB2DC/dxg9q1vpdTCHpVIUuOMigHxsbx/labXqI2obPBzILj7cMNl
 U7bvH1tdzypVNOhsYtthw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TtIMuQ1nnVA=:9jznN4tEJenOiBi4C5d0Aa
 c1SURlOkl+WSrna3uJOrrKYTS+49r12k9NvZ18ylKJR145fW9AM0+AulwbOuSq+KaCFQ8FNjn
 7AegQIm/wGO7mU+CLGxg4KcizJ94QZPoUo7oFSzBs7YXUTfXz7KOEeL/Zx70vbdU0aJ3YXtwW
 Zx6qKZz3GMAq6301q3aGFFfqjwgj5jlfIb+96SSFSnRLjo2ZRYz/W1Y/UHS1d+lX6UYbOhayI
 mOwxA4sDG0TBguh5Ek73OLns49RjMNPgG1MCYAEtkH/BaW92+XNfN4n6GiCoXzq5xMxRA5F44
 21+Bd55SInyqnfy5U30wwxHwgkfa6jgNoiFpsld0xpP2fW2h+xnIsHfWPmoRCAMyARteaA72x
 XOxikPzxVgUEqIpA4srQZpwQfi4vmTYsJuZ/PyOw99/s0nWnR/gFMTvJqtb71N46AEpCkaslA
 sLcpOgKgMPlcOGTbXuGZh7Cgo5sIForacYrFnjr6pi93JebCn6IXPdDH0K3LG4c3ZSivSmeUM
 uMXnBS5jShozAo6US2CnyI785XnqbLjWE0JvgThlrrKBeEWjaYTnsdeD/3XQQrprHzHrA++fY
 urFZp4aAN0imVU3TdembGkVKKE37x1JyX+2gayFaM5wfKhQMLOlSJcxK9f21H5DRlsMy24mxF
 e07q3WRdfS1g3+amolwCclK3DFxGBTlTyWYmN50XV2vf15cr/d9YsuYWkWr9Pag4ivOJZKClz
 l0IrP1vbiBXz1g51wnroK4jjexta2E65QJDXlyfHZl0orr5JHDJX0XyutBR96vkcFy/3SYfuI
 FkbIuOPLlumLPaQFhKxpJ3/UV0d5tEBK/Itq+oU3w/lqDWnFoU=
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
Cc: David Airlie <airlied@linux.ie>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Alain Volmat <alain.volmat@foss.st.com>, Laura Abbott <labbott@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 linaro-mm-sig@lists.linaro.org, SoC Team <soc@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Christian Konig <christian.koenig@amd.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 6:19 PM Philippe Cornu
<philippe.cornu@foss.st.com> wrote:
>
>  DRM DRIVERS FOR STI
> -M:     Benjamin Gaignard <benjamin.gaignard@linaro.org>
>  L:     dri-devel@lists.freedesktop.org
>  S:     Maintained
>  T:     git git://anongit.freedesktop.org/drm/drm-misc

If there is no longer a maintainer, I suppose it should also be marked as

S: Orphaned

         Arnd
